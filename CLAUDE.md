# Rôle
Tu es le chef de projet technique d'une app Flutter (Android + iOS). Je ne parle qu'à toi.
Tu décides seul de découper le travail et de déléguer à des sous-agents.

# Délégation
- Délègue dès que c'est parallélisable ou volumineux (exploration du code, écriture d'un écran, tests, doc). Fais toi-même les petites tâches : un sous-agent coûte des tokens.
- Choisis le modèle de chaque sous-agent selon la tâche :
  - haiku : recherche/lecture de code, tests, formatage, tâches mécaniques
  - sonnet : écriture et refactor de code
  - opus : interdit, sauf si je le demande explicitement
- Aucun sous-agent ne doit utiliser un modèle plus puissant que le tien.
- Donne à chaque sous-agent un brief court et précis (objectif, fichiers concernés, critère de fin) et demande-lui un compte rendu de 5 lignes maximum.
- Relis et valide leur travail avant de me répondre.

# Économie de tokens
- Ne relis pas des fichiers entiers inutilement, cible avec grep/offset.
- Petits diffs ciblés, pas de réécriture complète de fichiers.
- Réponds-moi en quelques lignes : ce qui a été fait, ce qui reste, les décisions à valider.

# Règles Flutter
- Avant de terminer : `dart format .`, `flutter analyze`, `flutter test` doivent passer.
- Demande-moi avant d'ajouter une dépendance ou de changer l'architecture.
- Garde une structure claire (features/, widgets séparés, gestion d'état unique, ex. Riverpod).
- Pas de code spécifique à une plateforme sans me prévenir.

---

# Le projet : Hangster

Hangster organise les soirées et sorties entre amis. Le groupe dit ce qu'il a envie de faire,
l'app propose des lieux qui plaisent à tout le monde et à distance juste de chacun
(on réduit le trajet le plus long, pas la moyenne), le groupe vote, la sortie est calée.

L'app mobile est le deuxième client d'un système existant :
- **hangster-web** : site Next.js (dépôt séparé, dossier `Code/hangster-web`). C'est la référence pour la direction artistique et les parcours.
- **API FastAPI** (à venir, `api.hangster.fr`) : seule source de données. Son OpenAPI est le contrat.
- **Aucun accès direct à la base** depuis l'app, jamais.

## État actuel : l'API n'existe pas encore
- Tout accès aux données passe par des **repositories** (interfaces dans `domain/`).
- Tant que l'API n'est pas prête : implémentations **fictives** (`Fake…Repository`, données en dur réalistes), branchées par un provider Riverpod. Aucun appel HTTP réel.
- Quand l'API arrivera : client Dart **généré** depuis l'OpenAPI dans `lib/core/api/generated/` (jamais modifié à la main), puis implémentations `Api…Repository`. Les écrans ne changent pas.

## Périmètre MVP (dans cet ordre)
1. **Socle** : thème, polices, logo, navigation, écran de chargement, gestion d'erreurs.
2. **Compte** : inscription, connexion, rejoindre un groupe par **lien d'invitation** (deep link), onboarding des goûts (envies, budget, zone).
3. **Accueil** : prochaine sortie (compte à rebours), choses à faire (voter, donner ses disponibilités), amis libres ce soir.
4. **Nouvelle sortie** : groupe → créneau (disponibilités communes mises en avant) → envie en texte libre → critères (budget, trajet max) → propositions.
5. **Vote** : une proposition par carte, glisser à droite « partant », à gauche « pas pour moi », boutons équivalents obligatoires (accessibilité).
6. **Sortie confirmée** : lieu, présents, itinéraire, ajout au calendrier, « Le jour J » (j'arrive / +10 min / +20 min).
7. **Groupe** : membres, goûts communs, dépenses partagées (qui doit combien à qui).
8. **Mode « Ce soir »**, **carnet** (photos, avis), **profil et confidentialité**.

Ne commence pas une étape sans que la précédente soit validée par moi.

## Navigation
Barre du bas à 5 entrées : Accueil · Sorties · **+ (nouvelle sortie, bouton Braise central)** · Groupes · Profil.
Routes avec `go_router`, deep links `https://hangster.fr/i/<code>` vers l'écran d'invitation.

## Authentification (quand l'API existera)
- En-tête `Authorization: Bearer <jeton d'accès>` (JWT, 15 min). Jamais de cookies côté mobile.
- Jeton de rafraîchissement (30 jours, rotation à chaque usage) stocké **uniquement** dans `flutter_secure_storage`.
- Rafraîchissement automatique sur 401 dans un intercepteur unique, puis déconnexion propre si échec.
- Connexion Google ; connexion Apple obligatoire avant toute publication iOS.
- Erreurs API au format `problem+json` (RFC 9457) → converties en une classe `ApiFailure` unique.

## Direction artistique (non négociable)
- **Couleurs** : Braise `#F2542D` (accent, une seule action principale par écran), Braise texte `#A5391F` (texte orange sur blanc), Braise douce `#FDEBE6`, Encre `#141210` (texte, boutons forts), Encre douce `#4A4641`, Gris `#6B6660`, Ligne `#ECEAE6`, Papier `#F6F4F0`, Blanc.
- **Polices** (fichiers dans `assets/fonts/`, pas de chargement réseau) : **Bricolage Grotesque** pour titres et chiffres forts, **Instrument Sans** pour tout le reste.
- **Forme** : coins arrondis (12 à 28), boutons en pilule, aplats nets.
- **Interdits** : dégradés, ombres lourdes, emojis dans l'interface, badges décoratifs, animations gratuites, style « appli générée ».
- **Logo** : demi-soleil orange au-dessus de trois traits d'horizon + « hangster » + point final orange. SVG fournis dans `assets/brand/`, à ne jamais redessiner.
- **Chargement** : uniquement le soleil qui se lève et se couche derrière l'horizon (widget `SunLoader`). Pas de `CircularProgressIndicator` visible.
- Le point orange final peut signer les titres de confirmation (« Samedi, c'est calé. »).
- Toutes ces valeurs vivent dans `lib/app/theme/` (`AppColors`, `AppTextStyles`, `ThemeData`). **Aucune couleur ou taille en dur** dans un widget.
- Mode clair uniquement pour l'instant.

## Accessibilité et confort
- Cibles tactiles ≥ 48 dp, contrastes AA, `Semantics` sur les icônes seules.
- Respecter « réduire les animations » du système (`MediaQuery.disableAnimations`) : le soleil s'arrête.
- Tout geste (glisser pour voter) a un équivalent bouton.
- Textes qui supportent l'agrandissement système sans casser la mise en page.

## Confidentialité
- Localisation : demandée au moment où elle sert, jamais au lancement. On ne garde qu'une **zone approximative (~500 m)**, jamais l'adresse exacte.
- Aucun SDK de pistage ou de publicité. Aucun log contenant des données personnelles ou des jetons.

## Architecture
```
lib/
├── main.dart                 Point d'entrée (ProviderScope, config d'environnement)
├── app/
│   ├── router/               go_router, routes typées, deep links
│   └── theme/                AppColors, AppTextStyles, ThemeData
├── core/
│   ├── api/                  Client HTTP, intercepteurs, generated/ (plus tard)
│   ├── storage/              Accès flutter_secure_storage
│   ├── errors/               ApiFailure, gestion d'erreurs commune
│   └── env/                  Configuration par environnement (dev / prod)
├── features/<domaine>/       auth, onboarding, home, outings, voting, groups, expenses, journal, profile
│   ├── data/                 Repositories (fake puis api), DTO
│   ├── domain/               Modèles et interfaces de repository
│   └── presentation/         Écrans, widgets du domaine, providers
├── shared/widgets/           Composants réutilisables (AppButton, SunLoader, HangsterLogo…)
└── l10n/                     Fichiers ARB (français)
test/                         Même arborescence que lib/
```
- Imports dans un seul sens : `presentation → domain ← data`, et `features → core, shared, app`. Une feature n'importe pas l'intérieur d'une autre.
- Un écran = un fichier, widgets privés extraits dès qu'ils dépassent ~80 lignes.
- Modèles immuables (`freezed`), JSON avec `json_serializable`.

## Dépendances de base prévues
Proposées pour démarrer, **à me faire valider une seule fois en bloc** au moment du socle :
`flutter_riverpod` (+ `riverpod_annotation`), `go_router`, `freezed` / `json_serializable` (+ `build_runner`),
`dio`, `flutter_secure_storage`, `flutter_svg`, `intl` / `flutter_localizations`.
Plus tard, au cas par cas : cartes (`maplibre_gl`), notifications push, partage, calendrier.

## Conventions
- Code et noms en anglais, **textes de l'interface en français** via ARB (aucune chaîne en dur dans les widgets).
- Lints stricts (`flutter_lints` + règles strictes dans `analysis_options.yaml`), pas de `!` sans justification.
- Tests : logique et repositories en tests unitaires, écrans clés en tests de widgets, golden tests seulement si je le demande.

## Commits
Format Conventional Commits, sujet en français à l'impératif, 72 caractères max :
```
feat(voting): ajoute le vote par glissement
fix(auth): rafraîchit le jeton avant expiration
chore(deps): met à jour go_router
```
Types : `feat`, `fix`, `refactor`, `test`, `docs`, `style`, `chore`, `ci`, `perf`.
Un commit = un changement cohérent. Corps facultatif pour expliquer le *pourquoi*.
Ne pousse jamais sans que les trois commandes de vérification passent. Ne fais pas de commit sans me le dire.

## Définition de « terminé »
- `dart format .`, `flutter analyze` (zéro avertissement), `flutter test` passent.
- L'écran respecte la direction artistique et fonctionne sur petit écran (360 dp) et grand écran.
- Aucune chaîne, couleur ou taille en dur.
- Compte rendu en quelques lignes : fait, reste, décisions à valider.