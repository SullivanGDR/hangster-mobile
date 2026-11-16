import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';

/// Ecran d'invitation provisoire (deep link /i/<code>).
class InvitationScreen extends StatelessWidget {
  const InvitationScreen({required this.code, super.key});

  final String code;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.invitationTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(l10n.invitationCode(code)),
          ],
        ),
      ),
    );
  }
}
