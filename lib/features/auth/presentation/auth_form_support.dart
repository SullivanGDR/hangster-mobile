import 'package:material_ui/material_ui.dart';

import '../../../core/errors/api_failure.dart';
import '../../../l10n/generated/app_localizations.dart';

final RegExp _emailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

/// Longueur minimale du mot de passe.
const int minPasswordLength = 8;

String? validateEmail(AppLocalizations l10n, String? value) =>
    _emailPattern.hasMatch((value ?? '').trim()) ? null : l10n.authEmailInvalid;

String? validatePassword(AppLocalizations l10n, String? value) =>
    (value ?? '').length >= minPasswordLength
    ? null
    : l10n.authPasswordTooShort;

String? validateDisplayName(AppLocalizations l10n, String? value) =>
    (value ?? '').trim().isEmpty ? l10n.authDisplayNameRequired : null;

/// Convertit une erreur en message localise. [validationMessage] sert au
/// cas [ApiValidation] (ex. e-mail deja utilise).
String authErrorMessage(
  AppLocalizations l10n,
  Object error, {
  required String validationMessage,
}) => switch (error) {
  ApiUnauthorized() => l10n.authErrorInvalidCredentials,
  ApiValidation() => validationMessage,
  ApiNetwork() => l10n.authErrorNetwork,
  _ => l10n.authErrorGeneric,
};

/// Chemin interne `from` valide : commence par '/' et pas par '//'.
String? validFromPath(String? from) =>
    from != null && from.startsWith('/') && !from.startsWith('//')
    ? from
    : null;

/// Route vers un autre ecran d'authentification en conservant `from`.
String authRouteWithFrom(String route, String? from) {
  final valid = validFromPath(from);
  return valid == null
      ? route
      : Uri(path: route, queryParameters: {'from': valid}).toString();
}

/// Message d'erreur visible au-dessus du bouton.
class AuthErrorBanner extends StatelessWidget {
  const AuthErrorBanner({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    child: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.error),
    ),
  );
}
