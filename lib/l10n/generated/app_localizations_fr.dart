// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Hangster';

  @override
  String get navHome => 'Accueil';

  @override
  String get navOutings => 'Sorties';

  @override
  String get navNewOuting => 'Nouvelle sortie';

  @override
  String get navGroups => 'Groupes';

  @override
  String get navProfile => 'Profil';

  @override
  String get loadingLabel => 'Chargement';

  @override
  String get errorGeneric => 'Une erreur est survenue.';

  @override
  String get errorRetry => 'Réessayer';

  @override
  String get homeTitle => 'Accueil';

  @override
  String get outingsTitle => 'Sorties';

  @override
  String get groupsTitle => 'Groupes';

  @override
  String get profileTitle => 'Profil';

  @override
  String get newOutingTitle => 'Nouvelle sortie';

  @override
  String get invitationTitle => 'Invitation';

  @override
  String invitationCode(String code) {
    return 'Code : $code';
  }
}
