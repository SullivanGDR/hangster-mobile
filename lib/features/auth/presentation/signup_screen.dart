import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/router/app_router.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/sun_loader.dart';
import '../domain/sign_up_data.dart';
import 'auth_form_support.dart';
import 'auth_providers.dart';
import 'widgets/auth_form_layout.dart';

/// Ecran d'inscription. [from] : chemin interne transmis a l'onboarding.
class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({this.from, super.key});

  final String? from;

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await ref
          .read(authControllerProvider.notifier)
          .signUp(
            SignUpData(
              email: _email.text.trim(),
              password: _password.text,
              displayName: _name.text.trim(),
            ),
          );
    } on Object catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = authErrorMessage(
          l10n,
          e,
          validationMessage: l10n.authErrorEmailTaken,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AuthFormLayout(
      title: l10n.signupTitle,
      child: Form(
        key: _formKey,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _name,
                enabled: !_loading,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.nickname],
                decoration: InputDecoration(
                  labelText: l10n.authDisplayNameLabel,
                ),
                validator: (v) => validateDisplayName(l10n, v),
              ),
              const SizedBox(height: AppDimens.spaceM),
              TextFormField(
                controller: _email,
                enabled: !_loading,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(labelText: l10n.authEmailLabel),
                validator: (v) => validateEmail(l10n, v),
              ),
              const SizedBox(height: AppDimens.spaceM),
              TextFormField(
                controller: _password,
                enabled: !_loading,
                obscureText: true,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.newPassword],
                onFieldSubmitted: (_) => _submit(),
                decoration: InputDecoration(labelText: l10n.authPasswordLabel),
                validator: (v) => validatePassword(l10n, v),
              ),
              if (_error != null) ...[
                const SizedBox(height: AppDimens.spaceM),
                AuthErrorBanner(message: _error!),
              ],
              const SizedBox(height: AppDimens.spaceL),
              if (_loading)
                Center(
                  child: SunLoader(
                    semanticLabel: l10n.loadingLabel,
                    width: AppDimens.loaderWidth,
                  ),
                )
              else
                AppButton(label: l10n.signupSubmit, onPressed: _submit),
              const SizedBox(height: AppDimens.spaceM),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(l10n.signupHasAccount),
                  TextButton(
                    onPressed: _loading
                        ? null
                        : () => context.go(
                            authRouteWithFrom(AppRoutes.login, widget.from),
                          ),
                    child: Text(l10n.signupGoLogin),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
