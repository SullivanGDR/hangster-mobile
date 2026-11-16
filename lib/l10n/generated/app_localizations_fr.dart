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
  String get newOutingStepOne => 'Nouvelle sortie, étape 1 sur 2';

  @override
  String get newOutingClose => 'Fermer';

  @override
  String get newOutingStepLabel => 'Étape 1 sur 2';

  @override
  String get newOutingHeading => 'On sort quand, et pour faire quoi ?';

  @override
  String get newOutingGroupLegend => 'Groupe';

  @override
  String newOutingGroupChip(String name, int count) {
    return '$name · $count';
  }

  @override
  String get newOutingGroupsEmpty => 'Vous n\'avez pas encore de groupe.';

  @override
  String get newOutingSlotsLegend => 'Quand tout le monde est libre';

  @override
  String get newOutingSlotsPickGroup =>
      'Choisissez un groupe pour voir les créneaux.';

  @override
  String get newOutingSlotsEmpty => 'Aucun créneau en commun pour ce groupe.';

  @override
  String newOutingSlotDay(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat('E d', localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String newOutingSlotFree(int free, int total) {
    return '$free sur $total';
  }

  @override
  String get newOutingWishLabel => 'Votre envie';

  @override
  String get newOutingWishHint =>
      'Un endroit pour parler, avec un peu de jeu, pas trop loin';

  @override
  String get newOutingBudgetLegend => 'Budget';

  @override
  String get newOutingTravelLegend => 'Trajet maximal';

  @override
  String newOutingTravelOption(int minutes) {
    return '$minutes min';
  }

  @override
  String get newOutingSubmit => 'Trouver des lieux';

  @override
  String get newOutingLoadError => 'Impossible de charger cette étape.';

  @override
  String get proposalsTitle => 'Propositions';

  @override
  String get proposalsBack => 'Retour';

  @override
  String get proposalsStep => 'Étape 2 sur 2';

  @override
  String get proposalsHeading =>
      'Les lieux sont classés pour que le trajet le plus long reste court.';

  @override
  String proposalsRecapGroup(String group, String slot) {
    return '$group · $slot';
  }

  @override
  String proposalsRecapCriteria(String budget, int minutes) {
    return '$budget · trajet max $minutes min';
  }

  @override
  String proposalsMeta(String category, int price, String duration) {
    return '$category · $price € · $duration';
  }

  @override
  String proposalsDurationMinutes(int minutes) {
    return 'jusqu\'à $minutes min';
  }

  @override
  String proposalsDurationHours(int hours) {
    return 'jusqu\'à $hours h';
  }

  @override
  String proposalsDurationHoursMinutes(int hours, String minutes) {
    return 'jusqu\'à $hours h $minutes';
  }

  @override
  String proposalsTravelRange(int min, int max) {
    return '$min à $max min pour tous';
  }

  @override
  String proposalsTravelSame(int minutes) {
    return '$minutes min pour tous';
  }

  @override
  String proposalsLongest(int minutes) {
    return 'Trajet le plus long : $minutes min';
  }

  @override
  String proposalsChoose(String name) {
    return 'Choisir $name';
  }

  @override
  String get proposalsSubmit => 'Proposer au groupe';

  @override
  String get proposalsSubmitCaption =>
      'Le groupe reçoit une notification et répond d\'un geste.';

  @override
  String get proposalsEmptyTitle => 'Aucun lieu ne convient';

  @override
  String get proposalsEmptyBody =>
      'Avec ces critères, aucun lieu n\'est à distance juste pour tout le monde. Élargissez le budget ou le trajet.';

  @override
  String get proposalsEmptyAction => 'Modifier mes critères';

  @override
  String get proposalsErrorBody => 'Impossible de charger les propositions.';

  @override
  String get loginTitle => 'Connexion';

  @override
  String get signupTitle => 'Inscription';

  @override
  String get loginSubmit => 'Se connecter';

  @override
  String get loginNoAccount => 'Pas encore de compte ?';

  @override
  String get loginGoSignup => 'Créer un compte';

  @override
  String get signupSubmit => 'Créer mon compte';

  @override
  String get signupHasAccount => 'Déjà un compte ?';

  @override
  String get signupGoLogin => 'Se connecter';

  @override
  String get authLogoLabel => 'Hangster';

  @override
  String get authEmailLabel => 'Adresse e-mail';

  @override
  String get authPasswordLabel => 'Mot de passe';

  @override
  String get authDisplayNameLabel => 'Nom affiché';

  @override
  String get authEmailInvalid => 'Saisissez une adresse e-mail valide.';

  @override
  String get authPasswordTooShort =>
      'Le mot de passe doit faire au moins 8 caractères.';

  @override
  String get authDisplayNameRequired => 'Saisissez votre nom.';

  @override
  String get authErrorInvalidCredentials => 'E-mail ou mot de passe incorrect.';

  @override
  String get authErrorEmailTaken => 'Cette adresse e-mail est déjà utilisée.';

  @override
  String get authErrorNetwork =>
      'Problème de connexion. Vérifiez votre réseau et réessayez.';

  @override
  String get authErrorGeneric =>
      'Une erreur est survenue. Réessayez dans un instant.';

  @override
  String get onboardingTitle => 'Vos goûts';

  @override
  String get invitationTitle => 'Invitation';

  @override
  String get invitationHeading => 'Vous êtes invité(e)';

  @override
  String invitationMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membres',
      one: '1 membre',
    );
    return '$_temp0';
  }

  @override
  String get invitationOpenVote => 'Un vote est ouvert';

  @override
  String get invitationJoin => 'Rejoindre';

  @override
  String get invitationSignInToJoin => 'Se connecter pour rejoindre';

  @override
  String get invitationSignup => 'Créer un compte';

  @override
  String get invitationJoinError =>
      'Impossible de rejoindre le groupe pour le moment.';

  @override
  String get invitationNotFoundTitle => 'Invitation introuvable';

  @override
  String get invitationNotFoundBody =>
      'Ce lien n\'existe pas ou a expiré. Demandez un nouveau lien à votre groupe.';

  @override
  String get invitationBackHome => 'Retour à l\'accueil';

  @override
  String onboardingStepOf(int step, int total) {
    return 'Étape $step sur $total';
  }

  @override
  String get onboardingCategoriesTitle => 'Qu\'est-ce qui vous fait sortir ?';

  @override
  String get onboardingCategoriesHint => 'Choisissez tout ce qui vous plaît.';

  @override
  String get onboardingCategoryBars => 'Bars';

  @override
  String get onboardingCategoryRestaurants => 'Restaurants';

  @override
  String get onboardingCategoryGames => 'Jeux';

  @override
  String get onboardingCategoryKaraoke => 'Karaoké';

  @override
  String get onboardingCategoryOutdoors => 'Plein air';

  @override
  String get onboardingCategoryConcerts => 'Concerts';

  @override
  String get onboardingBudgetTitle => 'Quel budget par sortie ?';

  @override
  String get onboardingBudgetHint => 'Le budget habituel par personne.';

  @override
  String get onboardingBudgetUnder15 => 'Moins de 15 €';

  @override
  String get onboardingBudgetFrom15to30 => '15 à 30 €';

  @override
  String get onboardingBudgetFrom30to50 => '30 à 50 €';

  @override
  String get onboardingBudgetOver50 => 'Plus de 50 €';

  @override
  String get onboardingZoneTitle => 'Où sortez-vous le plus souvent ?';

  @override
  String get onboardingZoneHint =>
      'Une zone approximative suffit. Nous ne gardons jamais votre adresse exacte.';

  @override
  String get onboardingZoneParis => 'Paris centre';

  @override
  String get onboardingZoneParisNordEst => 'Paris nord-est';

  @override
  String get onboardingZoneLyon => 'Lyon centre';

  @override
  String get onboardingZoneMarseille => 'Marseille Vieux-Port';

  @override
  String get onboardingZoneBordeaux => 'Bordeaux centre';

  @override
  String get onboardingZoneLille => 'Lille centre';

  @override
  String get onboardingBack => 'Retour';

  @override
  String get onboardingContinue => 'Continuer';

  @override
  String get onboardingSkip => 'Passer cette étape';

  @override
  String get onboardingFinish => 'Terminer';

  @override
  String get onboardingSaveError =>
      'Impossible d\'enregistrer vos goûts. Réessayez.';

  @override
  String invitationCode(String code) {
    return 'Code : $code';
  }

  @override
  String homeDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'EEEE d MMMM',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String homeGreetingMorning(String name) {
    return 'Bonjour $name';
  }

  @override
  String homeGreetingEvening(String name) {
    return 'Bonsoir $name';
  }

  @override
  String get homeGreetingMorningAnon => 'Bonjour';

  @override
  String get homeGreetingEveningAnon => 'Bonsoir';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String homeNotificationsNew(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nouvelles',
      one: '$count nouvelle',
    );
    return 'Notifications, $_temp0';
  }

  @override
  String homeNextOutingLabel(String group) {
    return 'Prochaine sortie · $group';
  }

  @override
  String homeNextOutingWhen(DateTime date, DateTime time) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'EEEE d',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);
    final intl.DateFormat timeDateFormat = intl.DateFormat(
      'H \'h\' mm',
      localeName,
    );
    final String timeString = timeDateFormat.format(time);

    return '$dateString · $timeString';
  }

  @override
  String homeNextOutingConfirmed(int confirmed, int total) {
    return '$confirmed sur $total viennent';
  }

  @override
  String homeAttendeesMore(int count) {
    return '+$count';
  }

  @override
  String get homeCountdownStarted => 'En cours';

  @override
  String get homeCountdownTonight => 'Ce soir';

  @override
  String get homeCountdownToday => 'Aujourd\'hui';

  @override
  String get homeCountdownTomorrow => 'Demain';

  @override
  String homeCountdownDays(int days) {
    return 'J-$days';
  }

  @override
  String homeCountdownSemantics(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dans $count jours',
      one: 'Dans $count jour',
    );
    return '$_temp0';
  }

  @override
  String homeFreeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amis libres ce soir',
      one: '$count ami libre ce soir',
    );
    return '$_temp0';
  }

  @override
  String homeFreeNames(String others, String last) {
    return '$others et $last';
  }

  @override
  String get homeTodoTitle => 'À faire';

  @override
  String homeTodoVote(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.EEEE(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Voter pour $dateString';
  }

  @override
  String get homeTodoVoteNoDate => 'Voter pour la prochaine sortie';

  @override
  String get homeTodoAvailability => 'Donner vos disponibilités';

  @override
  String homeTodoGroup(String group) {
    return '$group';
  }

  @override
  String homeTodoDueHours(String group, int hours) {
    return '$group · clôture dans $hours h';
  }

  @override
  String homeTodoDueDays(String group, int days) {
    return '$group · clôture dans $days j';
  }

  @override
  String get homeTodoVoteAction => 'Voter';

  @override
  String get homeTodoAvailabilityAction => 'Répondre';

  @override
  String get homeIdeasTitle => 'Idées pour ce week-end';

  @override
  String homeIdeaMeta(String category, int price, int minutes) {
    return '$category · $price € · $minutes min';
  }

  @override
  String get homeEmptyTitle => 'Aucune sortie en vue';

  @override
  String get homeEmptyBody =>
      'Lancez une sortie : dites ce dont vous avez envie, le groupe vote, c\'est calé.';

  @override
  String get homeEmptyAction => 'Nouvelle sortie';

  @override
  String get homeErrorBody => 'Impossible de charger votre accueil.';
}
