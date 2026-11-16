import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('fr')];

  /// No description provided for @appName.
  ///
  /// In fr, this message translates to:
  /// **'Hangster'**
  String get appName;

  /// No description provided for @navHome.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get navHome;

  /// No description provided for @navOutings.
  ///
  /// In fr, this message translates to:
  /// **'Sorties'**
  String get navOutings;

  /// No description provided for @navNewOuting.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle sortie'**
  String get navNewOuting;

  /// No description provided for @navGroups.
  ///
  /// In fr, this message translates to:
  /// **'Groupes'**
  String get navGroups;

  /// No description provided for @navProfile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get navProfile;

  /// No description provided for @loadingLabel.
  ///
  /// In fr, this message translates to:
  /// **'Chargement'**
  String get loadingLabel;

  /// No description provided for @errorGeneric.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue.'**
  String get errorGeneric;

  /// No description provided for @errorRetry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get errorRetry;

  /// No description provided for @homeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get homeTitle;

  /// No description provided for @outingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Sorties'**
  String get outingsTitle;

  /// No description provided for @groupsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Groupes'**
  String get groupsTitle;

  /// No description provided for @profileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profileTitle;

  /// No description provided for @newOutingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle sortie'**
  String get newOutingTitle;

  /// No description provided for @loginTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get loginTitle;

  /// No description provided for @signupTitle.
  ///
  /// In fr, this message translates to:
  /// **'Inscription'**
  String get signupTitle;

  /// No description provided for @loginSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get loginSubmit;

  /// No description provided for @loginNoAccount.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de compte ?'**
  String get loginNoAccount;

  /// No description provided for @loginGoSignup.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get loginGoSignup;

  /// No description provided for @signupSubmit.
  ///
  /// In fr, this message translates to:
  /// **'Créer mon compte'**
  String get signupSubmit;

  /// No description provided for @signupHasAccount.
  ///
  /// In fr, this message translates to:
  /// **'Déjà un compte ?'**
  String get signupHasAccount;

  /// No description provided for @signupGoLogin.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get signupGoLogin;

  /// No description provided for @authLogoLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hangster'**
  String get authLogoLabel;

  /// No description provided for @authEmailLabel.
  ///
  /// In fr, this message translates to:
  /// **'Adresse e-mail'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get authPasswordLabel;

  /// No description provided for @authDisplayNameLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom affiché'**
  String get authDisplayNameLabel;

  /// No description provided for @authEmailInvalid.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez une adresse e-mail valide.'**
  String get authEmailInvalid;

  /// No description provided for @authPasswordTooShort.
  ///
  /// In fr, this message translates to:
  /// **'Le mot de passe doit faire au moins 8 caractères.'**
  String get authPasswordTooShort;

  /// No description provided for @authDisplayNameRequired.
  ///
  /// In fr, this message translates to:
  /// **'Saisissez votre nom.'**
  String get authDisplayNameRequired;

  /// No description provided for @authErrorInvalidCredentials.
  ///
  /// In fr, this message translates to:
  /// **'E-mail ou mot de passe incorrect.'**
  String get authErrorInvalidCredentials;

  /// No description provided for @authErrorEmailTaken.
  ///
  /// In fr, this message translates to:
  /// **'Cette adresse e-mail est déjà utilisée.'**
  String get authErrorEmailTaken;

  /// No description provided for @authErrorNetwork.
  ///
  /// In fr, this message translates to:
  /// **'Problème de connexion. Vérifiez votre réseau et réessayez.'**
  String get authErrorNetwork;

  /// No description provided for @authErrorGeneric.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue. Réessayez dans un instant.'**
  String get authErrorGeneric;

  /// No description provided for @onboardingTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vos goûts'**
  String get onboardingTitle;

  /// No description provided for @invitationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Invitation'**
  String get invitationTitle;

  /// No description provided for @invitationHeading.
  ///
  /// In fr, this message translates to:
  /// **'Vous êtes invité(e)'**
  String get invitationHeading;

  /// No description provided for @invitationMembers.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 membre} other{{count} membres}}'**
  String invitationMembers(int count);

  /// No description provided for @invitationOpenVote.
  ///
  /// In fr, this message translates to:
  /// **'Un vote est ouvert'**
  String get invitationOpenVote;

  /// No description provided for @invitationJoin.
  ///
  /// In fr, this message translates to:
  /// **'Rejoindre'**
  String get invitationJoin;

  /// No description provided for @invitationSignInToJoin.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter pour rejoindre'**
  String get invitationSignInToJoin;

  /// No description provided for @invitationSignup.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get invitationSignup;

  /// No description provided for @invitationJoinError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de rejoindre le groupe pour le moment.'**
  String get invitationJoinError;

  /// No description provided for @invitationNotFoundTitle.
  ///
  /// In fr, this message translates to:
  /// **'Invitation introuvable'**
  String get invitationNotFoundTitle;

  /// No description provided for @invitationNotFoundBody.
  ///
  /// In fr, this message translates to:
  /// **'Ce lien n\'existe pas ou a expiré. Demandez un nouveau lien à votre groupe.'**
  String get invitationNotFoundBody;

  /// No description provided for @invitationBackHome.
  ///
  /// In fr, this message translates to:
  /// **'Retour à l\'accueil'**
  String get invitationBackHome;

  /// No description provided for @onboardingStepOf.
  ///
  /// In fr, this message translates to:
  /// **'Étape {step} sur {total}'**
  String onboardingStepOf(int step, int total);

  /// No description provided for @onboardingCategoriesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Qu\'est-ce qui vous fait sortir ?'**
  String get onboardingCategoriesTitle;

  /// No description provided for @onboardingCategoriesHint.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez tout ce qui vous plaît.'**
  String get onboardingCategoriesHint;

  /// No description provided for @onboardingCategoryBars.
  ///
  /// In fr, this message translates to:
  /// **'Bars'**
  String get onboardingCategoryBars;

  /// No description provided for @onboardingCategoryRestaurants.
  ///
  /// In fr, this message translates to:
  /// **'Restaurants'**
  String get onboardingCategoryRestaurants;

  /// No description provided for @onboardingCategoryGames.
  ///
  /// In fr, this message translates to:
  /// **'Jeux'**
  String get onboardingCategoryGames;

  /// No description provided for @onboardingCategoryKaraoke.
  ///
  /// In fr, this message translates to:
  /// **'Karaoké'**
  String get onboardingCategoryKaraoke;

  /// No description provided for @onboardingCategoryOutdoors.
  ///
  /// In fr, this message translates to:
  /// **'Plein air'**
  String get onboardingCategoryOutdoors;

  /// No description provided for @onboardingCategoryConcerts.
  ///
  /// In fr, this message translates to:
  /// **'Concerts'**
  String get onboardingCategoryConcerts;

  /// No description provided for @onboardingBudgetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Quel budget par sortie ?'**
  String get onboardingBudgetTitle;

  /// No description provided for @onboardingBudgetHint.
  ///
  /// In fr, this message translates to:
  /// **'Le budget habituel par personne.'**
  String get onboardingBudgetHint;

  /// No description provided for @onboardingBudgetUnder15.
  ///
  /// In fr, this message translates to:
  /// **'Moins de 15 €'**
  String get onboardingBudgetUnder15;

  /// No description provided for @onboardingBudgetFrom15to30.
  ///
  /// In fr, this message translates to:
  /// **'15 à 30 €'**
  String get onboardingBudgetFrom15to30;

  /// No description provided for @onboardingBudgetFrom30to50.
  ///
  /// In fr, this message translates to:
  /// **'30 à 50 €'**
  String get onboardingBudgetFrom30to50;

  /// No description provided for @onboardingBudgetOver50.
  ///
  /// In fr, this message translates to:
  /// **'Plus de 50 €'**
  String get onboardingBudgetOver50;

  /// No description provided for @onboardingZoneTitle.
  ///
  /// In fr, this message translates to:
  /// **'Où sortez-vous le plus souvent ?'**
  String get onboardingZoneTitle;

  /// No description provided for @onboardingZoneHint.
  ///
  /// In fr, this message translates to:
  /// **'Une zone approximative suffit. Nous ne gardons jamais votre adresse exacte.'**
  String get onboardingZoneHint;

  /// No description provided for @onboardingZoneParis.
  ///
  /// In fr, this message translates to:
  /// **'Paris centre'**
  String get onboardingZoneParis;

  /// No description provided for @onboardingZoneParisNordEst.
  ///
  /// In fr, this message translates to:
  /// **'Paris nord-est'**
  String get onboardingZoneParisNordEst;

  /// No description provided for @onboardingZoneLyon.
  ///
  /// In fr, this message translates to:
  /// **'Lyon centre'**
  String get onboardingZoneLyon;

  /// No description provided for @onboardingZoneMarseille.
  ///
  /// In fr, this message translates to:
  /// **'Marseille Vieux-Port'**
  String get onboardingZoneMarseille;

  /// No description provided for @onboardingZoneBordeaux.
  ///
  /// In fr, this message translates to:
  /// **'Bordeaux centre'**
  String get onboardingZoneBordeaux;

  /// No description provided for @onboardingZoneLille.
  ///
  /// In fr, this message translates to:
  /// **'Lille centre'**
  String get onboardingZoneLille;

  /// No description provided for @onboardingBack.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get onboardingBack;

  /// No description provided for @onboardingContinue.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get onboardingContinue;

  /// No description provided for @onboardingSkip.
  ///
  /// In fr, this message translates to:
  /// **'Passer cette étape'**
  String get onboardingSkip;

  /// No description provided for @onboardingFinish.
  ///
  /// In fr, this message translates to:
  /// **'Terminer'**
  String get onboardingFinish;

  /// No description provided for @onboardingSaveError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'enregistrer vos goûts. Réessayez.'**
  String get onboardingSaveError;

  /// No description provided for @invitationCode.
  ///
  /// In fr, this message translates to:
  /// **'Code : {code}'**
  String invitationCode(String code);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
