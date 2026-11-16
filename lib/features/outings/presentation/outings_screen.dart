import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';

/// Ecran provisoire.
class OutingsScreen extends StatelessWidget {
  const OutingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          l10n.outingsTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
