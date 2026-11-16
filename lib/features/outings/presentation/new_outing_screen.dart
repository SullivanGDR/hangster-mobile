import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';

/// Ecran provisoire.
class NewOutingScreen extends StatelessWidget {
  const NewOutingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          l10n.newOutingTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
