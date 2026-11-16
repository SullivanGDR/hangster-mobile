import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_dimens.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../shared/widgets/hangster_logo.dart';

/// Mise en page commune connexion / inscription : logo, titre, contenu.
class AuthFormLayout extends StatelessWidget {
  const AuthFormLayout({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimens.spaceL),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppDimens.formMaxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: HangsterLogo(
                      semanticLabel: l10n.authLogoLabel,
                      width: AppDimens.logoWidth,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spaceXl),
                  Semantics(
                    header: true,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spaceL),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
