# Spécification visuelle — Mobile · Accueil (MobileAccueil)

Source : maquette Design `3gvGEqu3HFDz2KmnLSYLpa`, fichier `project/MobileAccueil.dc.html` (lu en version 1794820055-6bcc). Cadre 390 × 844 px, fond blanc `#FFFFFF`. Accent = Braise `#F2542D` (valeur par défaut de la maquette).

## Tokens réutilisables

| Famille | Token | Valeur |
|---|---|---|
| Couleur | `Braise` | `#F2542D` (accent, une seule action principale) |
| Couleur | `BraiseTexte` | `#A5391F` (texte orange sur blanc) |
| Couleur | `BraiseDouce` | `#FDEAE6` calculé par la maquette (mix 12 % d'accent) ; la charte donne `#FDEBE6`, à trancher |
| Couleur | `Encre` | `#141210` |
| Couleur | `EncreDouce` | `#4A4641` |
| Couleur | `Gris` | `#6B6660` |
| Couleur | `Ligne` | `#ECEAE6` (bordures) |
| Couleur | `LigneNav` | `#F0EEEA` (séparateur de la barre du bas) |
| Couleur | `Papier` | `#F6F4F0` |
| Couleur | `Blanc` | `#FFFFFF` |
| Couleur | `GrisClair` | `#B5B0A9` (libellé sur fond sombre) |
| Couleur | `BrumeClaire` | `#D6D2CC` (texte secondaire sur fond sombre) |
| Couleur | `Avatar3` | `#D9D4CC` |
| Couleur | `IdeeSable` | `#EDE6DD` (vignette idée 1) |
| Couleur | `IdeeSauge` | `#E3E9E4` (vignette idée 2) |
| Typo | `Titre-Greeting` | Bricolage Grotesque 700 · 32 px · interlettrage −0.04 em (−1.28 px) · interligne 1.1 |
| Typo | `Titre-Hero` | Bricolage Grotesque 700 · 28 px · −0.035 em (−0.98 px) · interligne 1.1 |
| Typo | `Chiffre-Fort` | Bricolage Grotesque 700 · 34 px · −0.04 em (−1.36 px) · interligne 1.45 (hérité) |
| Typo | `Titre-Section` | Instrument Sans 700 · 18 px · interligne 1.45 (h2 par défaut, marge 0) |
| Typo | `Corps` | Instrument Sans 400 · 15 px · interligne 1.45 |
| Typo | `Corps-Fort` | Instrument Sans 650 · 15 px · interligne 1.45 (voir note ci-dessous) |
| Typo | `Meta` | Instrument Sans 400 · 13 px · interligne 1.45 |
| Typo | `Date` | Instrument Sans 400 · 14 px · `#6B6660` |
| Typo | `Bouton-Pilule` | Instrument Sans 600 · 14 px |
| Typo | `Avatar-Init` | Instrument Sans 700 · 10 px |
| Typo | `Nav-Label` | Instrument Sans 650 (actif) / 400 (inactif) · 11 px |
| Espacement | `gap-bloc` | 22 px entre les blocs de la colonne principale |
| Espacement | `gap-serré` | 10 px (titre de section → contenu « À faire ») |
| Espacement | `gap-carte` | 12 px (titre → idées ; entre cartes idées) |
| Espacement | `gap-interne` | 14 px (carte sombre ; entre texte et icône de la bannière) |
| Espacement | `marge-page` | 20 px gauche/droite ; 56 px haut ; 100 px bas |
| Espacement | `pad-carte` | 14 px vertical × 16 px horizontal (bannière, carte « À faire ») |
| Espacement | `pad-hero` | 20 px toutes faces |
| Rayon | `r-hero` | 24 px |
| Rayon | `r-carte` | 18 px (bannière, cartes « À faire », vignettes idées) |
| Rayon | `r-pilule` | 999 px (bouton « Voter », fond total) |
| Rayon | `r-rond` | 50 % (cloche, avatars, bouton +) |
| Taille icône | `ico-S` | 20 px (cloche, chevron) |
| Taille icône | `ico-M` | 22 px (éclair) |
| Taille icône | `ico-L` | 24 px (onglets, bouton +) |
| Trait icône | `trait` | valeur sur grille 24 ; épaisseur réelle = valeur × taille / 24 (voir section Icônes) |
| Bouton | `btn-plein-pilule` | fond `#141210`, texte blanc 14/600, padding 8 × 14, rayon 999 |
| Bouton | `btn-cercle-bordé` | 44 × 44 (cloche), bordure 1 px `#ECEAE6`, fond blanc |
| Bouton | `btn-plus` | cercle 52 px, fond Braise, icône `#141210` |
| Carte | `carte-sombre` | fond `#141210`, rayon 24, padding 20 |
| Carte | `carte-pâle` | fond `BraiseDouce`, rayon 18, padding 14 × 16 |
| Carte | `carte-contour` | fond transparent, bordure 1 px `#ECEAE6`, rayon 18, padding 14 × 16 |
| Pill | `avatar` | cercle 28 px, bordure 2 px `#141210`, chevauchement −7 px |
| Pill | `point-notif` | 8 px, bordure 2 px blanche, couleur Braise |
| Ombres / dégradés | aucun | aplats uniquement |

Note : `650` n'est pas un grade nommé Flutter. Utiliser la police variable (`wght` 650) ou, à défaut, `FontWeight.w600`.

## Structure et ordre des blocs (colonne principale)

Conteneur : padding 56 haut / 20 côtés / 100 bas, colonne, gap 22. Ordre :

1. **En-tête** (ligne, espace entre deux éléments, centré verticalement)
   - Colonne gauche : date « Mardi 14 octobre » (Date, `#6B6660`), puis salutation « Bonsoir Sacha » (Titre-Greeting, `#141210`, marge 0). Hauteur approx. 56 px.
   - Droite : bouton cloche, 44 × 44, cercle, bordure 1 px `#ECEAE6`, fond blanc. Icône cloche 20 px, trait 1.75 (`#141210`). Point de notification : 8 px, en haut 10 / à droite 11, fond Braise, bordure 2 px blanche. Libellé d'accessibilité : « Notifications, 2 nouvelles ».
2. **Carte sombre « Prochaine sortie »** (lien vers MobileSortie), carte-sombre, colonne, gap 14.
   - Ligne haute, espace entre deux colonnes, alignement haut :
     - Gauche : « Prochaine sortie · Les Jeudis » (13 px, `#B5B0A9`) ; « Le Phare Bleu » (Titre-Hero, blanc, marge haute 4) ; « Samedi 25 · 20 h 30 » (14 px, `#D6D2CC`).
     - Droite : « J-4 » (Chiffre-Fort 34 px, couleur Braise).
   - Ligne basse, espace entre deux éléments, centrée :
     - Gauche : 4 avatars 28 px (LÉ fond blanc ; HU fond Braise ; IN fond `#D9D4CC` ; +1 fond `#F6F4F0`). Texte des initiales en `#141210`, 10 px / 700, bordure 2 px `#141210`, chevauchement −7 px.
     - Droite : « 4 sur 6 viennent » (13 px, `#D6D2CC`).
   - Hauteur approx. 156 px.
3. **Bandeau « amis libres ce soir »** (lien vers MobileCeSoir), carte-pâle (fond BraiseDouce), ligne, gap 12, padding 14 × 16.
   - Éclair Lucide `zap` 22 px, trait 1.9, couleur `BraiseTexte` (#A5391F).
   - Texte (flex 1) : « 3 amis libres ce soir » (Corps-Fort, `#141210`) ; « Inès, Malik et Chloé » (Meta, `#4A4641`).
   - Chevron Lucide `chevron-right` 20 px, trait 2.0, `#141210`.
   - Hauteur approx. 69 px.
4. **Section « À faire »** (titre + carte), colonne, gap 10.
   - Titre « À faire » : Titre-Section (18 px / 700, `#141210`).
   - Carte-contour (lien vers MobileVote), ligne, gap 12, padding 14 × 16, bordure 1 px `#ECEAE6`, fond transparent.
     - Texte (flex 1) : « Voter pour vendredi » (Corps-Fort) ; « Coloc' · clôture dans 5 h » (Meta, `#6B6660`).
     - Pilule « Voter » : btn-plein-pilule (fond `#141210`, texte blanc 14 / 600, padding 8 × 14, rayon 999). Fond noir, pas Braise, dans la maquette.
   - Hauteur approx. 69 px.
5. **Section « Idées pour ce week-end »**, colonne, gap 12.
   - Titre : Titre-Section (18 px / 700).
   - Rangée horizontale, gap 12, marge droite −20 (déborde jusqu'au bord de l'écran), `overflow: hidden`.
     - Carte 1 : colonne, gap 10, largeur 220. Vignette 220 × 130, rayon 18, fond `#EDE6DD`. « Ping Club Oberkampf » (Corps-Fort) ; « Jeux · 12 € · 10 min » (Meta, `#6B6660`).
     - Carte 2 : identique. Vignette fond `#E3E9E4`. « Guinguette du Canal » ; « Plein air · 10 € · 14 min ».
   - Hauteur approx. 181 px. Pas de cadre ni d'ombre sur les cartes : seule la vignette porte la forme.

Positions verticales approximatives (haut du bloc, en px depuis le haut du cadre) : en-tête 56 · carte sombre ≈ 133 · bandeau ≈ 311 · « À faire » ≈ 402 · idées ≈ 529. Ces valeurs sont des estimations issues des tailles de texte, pas des coordonnées de la maquette.

## Barre d'onglets (nav du bas)

- Position : absolue, bas du cadre, pleine largeur (0 à 390), **hauteur 84 px**, fond blanc.
- Bordure haute 1 px `#F0EEEA`. `box-sizing` inclus. Padding haut 8 px.
- Disposition : `space-around`, aligné en haut.
- Chaque entrée « texte » : largeur 64 px, colonne centrée, gap 3 px entre icône 24 px et libellé 11 px (interligne 1.45, soit une hauteur totale d'environ 43 px).
- Bouton central « + » : cercle 52 × 52, fond Braise, marge haute −4 px (il dépasse de 4 px au-dessus de la ligne des onglets), icône Lucide `plus` 24 px, trait 2.3, couleur `#141210`. Libellé d'accessibilité « Nouvelle sortie », sans texte visible.

Centres horizontaux calculés (largeurs 64/64/52/64/64, espace réparti) : Accueil ≈ 40, Sorties ≈ 121, + ≈ 195, Groupes ≈ 269, Profil ≈ 350. Les écarts ne sont pas égaux sur les bords : en Flutter, préférer une répartition explicite (`Row` + `Expanded`) qui reproduise ces centres ou, plus simple, des colonnes égales de 390/5 = 78 px, à valider.

| Entrée | Icône Lucide (nom approché) | Libellé | Trait (sur 24) | Couleur actif | Couleur inactif |
|---|---|---|---|---|---|
| Accueil | `house` | Accueil | 1.9 | `#141210` (icône + libellé) | — |
| Sorties | `calendar` | Sorties | 1.75 | — | `#6B6660` |
| + (central) | `plus` | (aria-label « Nouvelle sortie ») | 2.3 | fond Braise, icône `#141210` | — |
| Groupes | `users` | Groupes | 1.75 | — | `#6B6660` |
| Profil | `user` | Profil | 1.75 | — | `#6B6660` |

**État actif** : seul « Accueil » est actif (`aria-current="page"`). Icône et libellé passent en `#141210`, le libellé passe en 650 (inactif : 400). Il n'y a ni pastille ni soulignement : la seule différence est la couleur et le grade. Les autres onglets sont en `#6B6660`, libellé en 400.

**Note contraste** : `#6B6660` sur blanc est lisible (AA). Le texte orange de la maquette n'est pas utilisé sur la nav ; l'accent Braise seul (`#F2542D`) sur blanc n'atteint pas 4,5:1, donc réserver la couleur Braise aux fonds et utiliser `BraiseTexte` pour le texte.

## Icônes

Toutes sont des tracés SVG à traits (stroke, `stroke-linecap` et `stroke-linejoin` = round), `fill: none`, grille 24 × 24. Les noms Lucide sont les plus proches ; la cloche et l'éclair ont des tracés spécifiques, à reproduire à l'identique si besoin.

| Icône | Nom Lucide approché | Taille | Trait (sur 24) | Épaisseur réelle | Couleur |
|---|---|---|---|---|---|
| Cloche (notifications) | `bell` (tracé spécifique) | 20 px | 1.75 | ≈ 1.46 px | `#141210` |
| Éclair (bandeau) | `zap` (tracé spécifique) | 22 px | 1.9 | ≈ 1.74 px | `BraiseTexte` `#A5391F` |
| Chevron (bandeau) | `chevron-right` | 20 px | 2.0 | ≈ 1.67 px | `#141210` |
| Accueil | `house` | 24 px | 1.9 | 1.9 px | `#141210` |
| Sorties | `calendar` | 24 px | 1.75 | 1.75 px | `#6B6660` |
| + (central) | `plus` | 24 px | 2.3 | 2.3 px | `#141210` |
| Groupes | `users` | 24 px | 1.75 | 1.75 px | `#6B6660` |
| Profil | `user` | 24 px | 1.75 | 1.75 px | `#6B6660` |

Bouton cloche : son icône est dans un cercle de 44 px (cible à 44 px, inférieure aux 48 dp du brief : voir points à valider).

## Textes (inventaire)

| Texte | Style | Couleur |
|---|---|---|
| Mardi 14 octobre | Date (14 px) | `#6B6660` |
| Bonsoir Sacha | Titre-Greeting 32 px / 700 | `#141210` |
| Prochaine sortie · Les Jeudis | 13 px | `#B5B0A9` |
| Le Phare Bleu | Titre-Hero 28 px / 700 | `#FFFFFF` |
| Samedi 25 · 20 h 30 | 14 px | `#D6D2CC` |
| J-4 | Chiffre-Fort 34 px / 700 | Braise |
| LÉ / HU / IN / +1 | 10 px / 700 | `#141210` |
| 4 sur 6 viennent | 13 px | `#D6D2CC` |
| 3 amis libres ce soir | 15 px / 650 | `#141210` |
| Inès, Malik et Chloé | 13 px | `#4A4641` |
| À faire | 18 px / 700 | `#141210` |
| Voter pour vendredi | 15 px / 650 | `#141210` |
| Coloc' · clôture dans 5 h | 13 px | `#6B6660` |
| Voter | 14 px / 600 | `#FFFFFF` sur `#141210` |
| Idées pour ce week-end | 18 px / 700 | `#141210` |
| Ping Club Oberkampf / Guinguette du Canal | 15 px / 650 | `#141210` |
| Jeux · 12 € · 10 min / Plein air · 10 € · 14 min | 13 px | `#6B6660` |
| Accueil / Sorties / Groupes / Profil | 11 px (650 actif, 400 inactif) | `#141210` / `#6B6660` |

Les textes de la maquette sont en dur (aucun libellé dynamique). En Flutter, tous passent par l'ARB (fr).

## Points à valider

1. **Braise douce** : la maquette calcule `#FDEAE6`, la charte donne `#FDEBE6`. Choisir l'une des deux (écart d'une unité, négligeable).
2. **Bouton « Voter »** : fond noir dans la maquette, alors que la charte réserve Braise à l'action principale de l'écran. Cohérent avec la demande, à confirmer.
3. **Cibles tactiles** : cloche 44 px et pilule « Voter » d'environ 36 px de haut sont sous 48 dp. Prévoir une zone de tap élargie (la carte « À faire » entière est cliquable, ce qui couvre le besoin).
4. **Grade 650** : hors grades nommés Flutter ; décider entre police variable et w600.
5. **Contenu fixe** : date, prénom, prochaine sortie et idées sont en dur dans la maquette ; à relier aux repositories fictifs.
