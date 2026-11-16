# Hangster mobile : spécification visuelle des autres écrans

Source : artifact `3gvGEqu3HFDz2KmnLSYLpa` (type Design, version 1794820055-6bcc), fichiers `project/MobileCeSoir.dc.html`, `MobileNouvelle.dc.html`, `MobileVote.dc.html`, `MobileSortie.dc.html`, `MobileGroupe.dc.html`.

Cadre de référence : 390 × 844 px. 1 px CSS = 1 dp Flutter. Les valeurs sont celles de la maquette ; les écarts avec la DA (`docs` / brief) sont signalés en **À valider**.

Les initiales, noms, lieux et montants sont des données de maquette (fictives).

---

## 0. Règles communes

### Couleurs
| Rôle | Hex | Usage |
|---|---|---|
| Blanc | `#FFFFFF` | fond, cartes, segments |
| Encre | `#141210` | texte, bordures sélectionnées, boutons forts |
| Encre douce | `#4A4641` | texte secondaire, segments inactifs |
| Gris | `#6B6660` | méta, sous-titres, nav inactive |
| Ligne | `#ECEAE6` | bordures de cartes et boutons ronds |
| Papier | `#F6F4F0` | fond de l'écran Vote, pastilles, tuiles, piste de segment |
| Braise | `#F2542D` | accent (`{{accent}}` par défaut) |
| Braise texte | `#A5391F` | `accentInk` (texte sur fond clair) |
| Braise douce | `#FDEBE6` (brand) | `accentSoft` ; la maquette calcule `#FDEAE6` : garder `#FDEBE6` |
| Noir chaud (Le jour J, solde) | `#141210` | blocs sombres |

Couleurs utilisées par la maquette hors palette (**À valider**, voir section 7) : `#F0EEEA` (filet de nav), `#E4E1DC` (bordure de chip), `#D6D2CC` (bordure pointillée), `#DCD8D1` (barre de progression vide), `#D9D4CC`, `#E9E5DF` (avatars), `#3A3632` (bordure sur fond noir), `#B5B0A9` (label sur fond noir), `#EDE6DD`, `#E8E5EE`, `#E3E9E4` (vignettes de lieux).

### Typographie
- **Instrument Sans** : tout le texte. Poids utilisés : 400, 500, 600, 650, 700.
- **Bricolage Grotesque** : titres d'écran et chiffres forts. Poids : 700, 750 (lettre « J »). Axe `opsz` 12..96 non reproductible tel quel en Flutter : prendre les fichiers de `assets/fonts/`.
- **À valider** : le poids 650 n'existe pas en statique. Choisir w600 ou w700 ; la maquette est entre les deux.
- Corps par défaut : 15 px, interligne 1.45 (hauteur de ligne ≈ 21.75 px), couleur Encre.
- `h2` sans graisse explicite dans la maquette : graisse navigateur = 700. Idem `h2` 17 px, 16 px.
- Lignes de méta : 13 px, Gris. Labels de nav : 11 px.

### Forme et bordures
- Boutons ronds : 44 px (retour), 48 px (info), 68 px (vote).
- Pilules : `border-radius: 999` (chips, labels, pills d'action).
- Cartes : rayon 16 à 22 (sauf carte de vote 28, cartes de créneau 16, vignette 14, bloc sombre 20 ou 22).
- Bordure sélectionnée : 2 px Encre. Bordure repos : 1 px Ligne (ou `#E4E1DC` pour les chips).
- Quand la bordure passe de 1 à 2 px, le padding baisse de 1 px pour éviter le décalage (ex. 15 → 14, 13 → 12).

### Bordures et ombres
- Aucun dégradé, aucun emoji, aucun badge décoratif.
- Ombres présentes dans la maquette :
  - Carte Vote : `0 1px 2px rgba(20,18,16,0.06), 0 20px 48px rgba(20,18,16,0.12)`.
  - Boutons Vote (X et coche) : `0 6px 18px rgba(20,18,16,0.10)` (X) et `0 6px 18px rgba(20,18,16,0.12)` (coche).
  - Segment actif : `0 1px 3px rgba(20,18,16,0.12)`.
  - **À valider** : la DA interdit les ombres lourdes. Proposition : garder seulement la ligne 1 px pour la carte et l'aplat/bordure pour les boutons ; ombre `0 1px 3px` au plus pour le segment actif.

### Barre de statut et zone sûre
- La maquette simule une marge haute de 52 px (padding). En Flutter : `SafeArea` + padding de 20 px, sans fausse barre de statut (interdit par le brief).

### Cibles tactiles
- Plusieurs éléments font moins de 48 dp (voir section 7). Règle : zone de touche ≥ 48 × 48 dp, visuel possiblement plus petit.

---

## 1. Mobile — Ce soir

**Fond** : `#FFFFFF`. Pas de barre de nav ; CTA fixe en bas.

**Structure (haut → bas)**
1. Zone haute : padding haut 52, latéraux 20, bas 120 (réserve du CTA). Colonne, gap 22.
2. Ligne retour (bouton rond 44 px).
3. Titre : « Ce soir », sous-titre.
4. Section « Qui est libre ».
5. Section « À moins de 15 minutes pour vous quatre » + 3 cartes de lieu.
6. CTA fixé en bas.

**Ligne retour**
- Bouton rond 44 × 44, `border-radius: 50%`, bordure 1 px `#ECEAE6`, centré.
- Icône `chevron-left`, 20 px, trait 2, Encre, arrondi.
- Label Semantics : « Retour ».

**Titre**
- « Ce soir » : Bricolage Grotesque 700, 40 px, `letter-spacing -0.045em` (≈ -1.8 px), interligne 1.0.
- Sous-titre « Mardi 14 · à partir de 20 h · autour de vous » : 15 px, Gris, marge haute 6.

**Section « Qui est libre »**
- Titre h2 17 px, gap titre → contenu : 12.
- Rangée de 4 boutons : `Row`, gap 10, chaque bouton `Expanded` (≈ 80 px sur 350 utiles).
- Chaque bouton : colonne centrée, gap 6, padding 12 px 6 px (horizontal 6).
  - Avatar : 40 × 40 cercle, initiales 12 px, graisse 700, centré. Fonds : Inès `#D9D4CC`, Malik `#F6F4F0`, Chloé `#E9E5DF`.
  - Prénom : 13 px, graisse 650 (→ 600 ou 700), Encre.
- États :
  - Sélectionné (`aria-pressed=true`) : bordure 2 px Encre, rayon 16, fond blanc.
  - Ajouter (« Inviter ») : bordure 1 px **pointillée** `#D6D2CC`, padding haut/bas 13, texte Encre douce `#4A4641`. Avatar : fond `#F6F4F0` avec icône `plus` 18 px, trait 2, Encre. Texte « Inviter » 13 px, graisse 400.
  - Note : le fond Malik `#F6F4F0` sur carte blanche est peu contrasté (aplat seul, pas de texte à 3:1).

**Section « À moins de 15 minutes pour vous quatre »**
- Titre h2 17 px ; gap titre → cartes : 10 ; gap entre cartes : 10.
- Carte = `label` cliquable, `Row`, gap 14, alignement centre.
  - Sélectionnée : padding 14, rayon 18, bordure 2 px Encre.
  - Non sélectionnée : padding 15, rayon 18, bordure 1 px `#ECEAE6`.
  - Pas d'ombre, fond blanc.
- Vignette : 64 × 64, rayon 14, aplat : `#EDE6DD` (Le Phare Bleu), `#E8E5EE` (Quiz du Mardi), `#E3E9E4` (Chez Mirabelle). Pas d'image dans la maquette (placeholder).
- Texte (`Expanded`, `minWidth 0`) :
  - Nom : 15 px, graisse 700, Encre.
  - Méta : 13 px, Gris (ex. « Cocktails · 15 € · jusqu'à 2 h »).
  - Temps : 13 px, graisse 600, Encre, marge haute 2 (ex. « 8 à 13 min pour tous »).
- Sélecteur : `Radio`, 22 × 22, couleur active Encre (`#141210`) (accent-color), pas Braise. Label accessible « Choisir <nom> ».

**CTA fixé en bas**
- Conteneur : pleine largeur, `bottom: 0`, padding 14 haut, 20 latéraux, 30 bas, fond blanc, filet haut 1 px `#F0EEEA`. Colonne, gap 8.
- Bouton : hauteur 54, rayon 16, fond Braise (`{{accent}}`), texte Encre 15 px graisse 650 (→ 600/700), centré.
- Légende : 13 px, Gris, centrée : « Ils reçoivent une notification et répondent d'un geste. »
- Libellé bouton : « Proposer à Inès, Malik et Chloé ».
- Contraste Encre sur Braise ≈ 5.3:1 (AA texte normal OK).

**États**
- Radio sélectionnée : noire pleine. Carte sélectionnée : bordure Encre 2 px.
- Pas d'état désactivé dans la maquette.

---

## 2. Mobile — Nouvelle sortie (étape 1 sur 2)

**Fond** : `#FFFFFF`. Pas de nav basse. CTA fixe en bas.

**Structure**
1. Padding haut 52, latéraux 20, bas 120. Colonne, gap 24.
2. Ligne haut : bouton fermer à gauche, « Étape 1 sur 2 » à droite.
3. Titre.
4. Fieldset « Groupe » (chips).
5. Fieldset « Quand tout le monde est libre » (cartes de date).
6. Bloc « Votre envie » (label + zone de saisie + chips).
7. CTA fixé en bas.

**Ligne haut**
- Bouton fermer : 44 × 44 rond, bordure 1 px `#ECEAE6`, icône `x` 18 px, trait 2.2, Encre. Label « Fermer ».
- « Étape 1 sur 2 » : 14 px, Gris, à droite (`space-between`).

**Titre**
- « On sort quand, et pour faire quoi ? » : Bricolage 700, 34 px, `letter-spacing -0.04em` (≈ -1.36 px), interligne 1.05.

**Légende de section (Groupe, Quand…)**
- 15 px, graisse 650 (→ 600/700), marge basse 10, padding 0.

**Chips de groupe**
- Rangée horizontale, gap 8, scroll horizontal (dans la maquette : `margin-right -20`, `overflow hidden` ; en Flutter : `ListView` horizontal avec padding 20 et clip au bord écran).
- Chip : hauteur 42, padding horizontal 16, rayon 999, texte 15 px.
  - Sélectionné (`aria-pressed=true`) : fond Encre `#141210`, texte blanc, graisse 650.
  - Repos : fond blanc, bordure 1 px `#E4E1DC`, texte Encre, graisse 400.
- Libellés : « Les Jeudis · 6 », « Coloc' · 4 », « Équipe foot · 9 ».

**Cartes de date (créneau)**
- Largeur fixe 104, rayon 16, `padding` 12 (sélectionnée, bordure 2 px) ou 13 (repos, bordure 1 px `#E4E1DC`).
- Colonne, gap 2, alignement gauche.
  - Jour : 15 px, graisse 700, Encre (ex. « Sam. 25 »).
  - Moment : 13 px, Gris (« Soirée », « Après-midi »).
  - Dispos : 13 px. Sélectionnée : graisse 650, Encre (« 6 sur 6 »). Repos : graisse 400, Encre douce `#4A4641`.
- Rangée horizontale, gap 8, même scroll débordant que les chips.
- Sélectionnée = meilleure dispo (« 6 sur 6 »). La maquette met en avant les disponibilités communes ; le « 6 sur 6 » est le signal.

**Bloc « Votre envie »**
- Label : 15 px, graisse 650, marge basse 10 (ex. gap 10 avec la zone).
- Zone de saisie : rayon 20, bordure 2 px Encre, padding 16, colonne, gap 12, fond transparent.
  - `TextField` multi-lignes sans bordure, 3 lignes, pas de resize.
  - Texte : Bricolage Grotesque 600, 21 px, `letter-spacing -0.02em` (≈ -0.42 px), interligne 1.3, Encre.
  - Valeur exemple : « Un endroit pour parler, avec un peu de jeu, pas trop loin pour Hugo ».
- Chips suggérées : rangée wrap, gap 6.
  - Pilule : padding 6 × 12, rayon 999, fond `accentSoft` (`#FDEBE6`), texte `accentInk` (`#A5391F`), 13 px, graisse 600.
  - Libellés : « Pour discuter », « Jeux », « Hugo ≤ 20 min ».

**CTA fixé en bas**
- Conteneur : `bottom: 0`, padding 14 / 20 / 30, fond blanc, filet haut 1 px `#F0EEEA`. Pas de légende.
- Bouton : hauteur 54, rayon 16, fond Braise, texte Encre 15 px graisse 650 (→ 600/700), gap 10 avec icône.
- Icône `arrow-right`, 18 px, trait 2, Encre, à droite du libellé.
- Libellé : « Trouver des lieux ».

**États**
- Chip / date : sélectionné = bordure ou fond noir. Repos = bordure claire.
- Textarea : pas d'état focus dans la maquette (**À valider** : prévoir un focus visible, bordure Encre 2 px déjà présente).

---

## 3. Mobile — Vote (carte à glisser, boutons croix / info / coche)

**Fond** : `#F6F4F0` (papier), pas de blanc plein. Pas de nav basse.

**Structure**
1. Haut : padding haut 52, latéraux 20. Colonne, gap 16.
   - Ligne : retour (gauche) / bloc titre centré / « 2/4 » (droite).
   - Barre de progression : 4 segments.
2. Zone de cartes (empilement absolu) :
   - Carte arrière (fantôme).
   - Carte avant (à glisser).
3. Contrôles bas : boutons X / info / coche, puis légende.

**Ligne haut**
- Retour : 44 × 44 rond, fond **blanc** (pas de bordure), icône `chevron-left` 20 px, trait 2, Encre.
- Titre centré :
  - « Samedi 25 · Les Jeudis » : 15 px, graisse 650, Encre.
  - « Vote ouvert jusqu'à jeudi 18 h » : 13 px, Gris.
- « 2/4 » : 14 px, graisse 650, largeur fixe 44, aligné à droite.

**Barre de progression**
- Rangée, gap 4, 4 segments `Expanded`, hauteur 4, rayon 9 (pilule).
- Segment rempli (actif et précédents) : Encre `#141210`. Segment à venir : `#DCD8D1`.
- Sémantique : « Proposition 2 sur 4 ».

**Carte arrière (fantôme)**
- Position : left 32, right 32, top 168 (relatif à l'écran), hauteur 470.
- Rayon 28, fond blanc, opacité 0.6.
- Transformation : `translateY(14)` et `scale(0.94)`.
- Pas de contenu.

**Carte avant (à glisser)**
- Position : left 20, right 20, top 152, hauteur 486.
- Rayon 28, fond blanc, clip (overflow hidden), colonne.
- Ombre : `0 1px 2px rgba(20,18,16,0.06), 0 20px 48px rgba(20,18,16,0.12)` (**À valider**, voir section 0).

**Visuel de la carte avant**
1. Couverture : hauteur 230, fond `#EDE6DD` (placeholder photo). Pastille positionnée à gauche 16, bas 16 :
   - Fond blanc, padding 6 × 12, rayon 999, 13 px, graisse 650, Encre.
   - Texte : « 3 amis partants ».
2. Corps : padding 20, colonne, gap 12.
   - Titre : Bricolage Grotesque 700, 28 px, `letter-spacing -0.035em` (≈ -0.98 px), interligne 1.1, marge 0.
   - Sous-titre : 14 px, Gris, marge haute 2 : « Bar à ping-pong · 12 € · jusqu'à 1 h ».
   - Description : 15 px, Encre douce `#4A4641`, marge 0 : « Six tables et une terrasse chauffée. Réservable pour un groupe de six. ».
   - Rangée de pastilles, gap 8 :
     - Pilule : padding 7 × 12, rayon 999, fond `#F6F4F0`, 13 px, graisse 600, Encre.
     - « Vous : 10 min », « Le plus long : 15 min ».

**Contrôles bas**
- Conteneur : `bottom: 40`, centré, colonne, gap 14.
- Rangée : gap 28, centrée.
  1. **Pas pour moi** (croix) : bouton 68 × 68, rond, fond blanc, sans bordure, ombre `0 6px 18px rgba(20,18,16,0.10)`. Icône `x` 28 px, trait 2.2, Encre. Label « Pas pour moi ».
  2. **Info** (lieu) : lien 48 × 48, rond, fond blanc, sans ombre. Icône `info` 20 px, trait 2, Encre. Label « Voir la fiche du lieu ».
  3. **Partant** (coche) : bouton 68 × 68, rond, fond Braise, sans bordure, ombre `0 6px 18px rgba(20,18,16,0.12)`. Icône `check` 30 px, trait 2.4, Encre, arrondi. Label « Partant ».
- Légende : 13 px, Gris, centrée : « Glissez à droite si vous êtes partant ».

**Geste**
- La maquette ne définit ni rotation, ni overlay coloré pendant le glissement. Les boutons X et coche sont l'équivalent obligatoire.
- **À valider** : seuil de bascule, rotation et teinte pendant le drag.

**États**
- Bouton info : état repos seul (pas de disabled).
- Carte fantôme : état « suivante ».

---

## 4. Mobile — Sortie confirmée (bloc « Le jour J », RSVP, trajet)

**Précision** : le bloc « Le jour J » de la maquette contient **J'arrive / +10 min / +20 min**. Les boutons **Je viens / Peut-être / Non** sont un segment séparé, au-dessus du bloc. Les deux sont décrits ci-dessous.

**Fond** : blanc. Bandeau d'en-tête en Braise (aplat, sans radius). Nav basse fixe (voir section 6).

**Structure**
1. En-tête Braise : padding 52 haut, 20 latéraux, 24 bas. Colonne, gap 16.
2. Corps : padding 22 haut, 20 latéraux, 100 bas. Colonne, gap 22.
   - Segment « Votre réponse ».
   - Ligne « 4 sur 6 viennent » + avatars empilés.
   - Bloc « Le jour J » (fond Encre).
   - Carte « trajet ».
3. Nav basse fixe.

**En-tête Braise**
- Fond `{{accent}}` (`#F2542D`), aplat net.
- Retour : 44 × 44 rond, fond blanc, sans bordure, `chevron-left` 20 px, trait 2, Encre.
- Date : « Samedi 25 octobre · 20 h 30 » : 15 px, graisse 650, Encre.
- Titre : « C'est calé : Le Phare Bleu » : Bricolage Grotesque 700, 38 px, `letter-spacing -0.045em` (≈ -1.7 px), interligne 1.0, marge haute 4. **À valider** : pas de point orange final (brief : le point orange peut signer les titres de confirmation).
- Adresse : 14 px, Encre, marge haute 8 : « Rue Oberkampf, Paris 11e · table pour 6 ».
- Rangée d'actions, gap 8 :
  - **Itinéraire** : `Expanded`, hauteur 44, rayon 12, fond Encre, texte blanc 14 px graisse 650.
  - **Calendrier** : `Expanded`, hauteur 44, rayon 12, fond blanc, texte Encre 14 px graisse 600.
  - **Partager** : 44 × 44, rayon 12, fond blanc, icône `share` 20 px, trait 1.9, Encre. Label « Partager ».

**Segment « Votre réponse »** (`role=group`)
- Conteneur : padding 4, rayon 14, fond `#F6F4F0`, gap 4, colonne → rangée.
- Trois segments `Expanded`, hauteur 40, rayon 10 :
  - Sélectionné (`aria-pressed=true`) : fond blanc, ombre `0 1px 3px rgba(20,18,16,0.12)`, texte Encre 14 px graisse 650.
  - Repos : fond transparent, texte `#4A4641` 14 px graisse 400.
- Libellés : « Je viens » (sélectionné par défaut), « Peut-être », « Non ».

**Ligne « 4 sur 6 viennent »**
- Gauche : h2 « 4 sur 6 viennent » 17 px, graisse 700 ; sous-titre 13 px Gris « Malik confirme demain ».
- Droite : avatars empilés, rangée, chevauchement -8 px (`margin-left -8`).
  - Taille déclarée 34 × 34, bordure 2 px blanc (la maquette n'utilise pas `box-sizing: border-box` : diamètre total 38 px). **À valider** : appliquer 34 px total.
  - Initiales 11 px, graisse 700, centrées.
  - Ordre et fond :
    - LÉ : fond Encre, texte blanc.
    - HU : fond `accentSoft`, texte `accentInk`.
    - IN : fond `#D9D4CC`, texte Encre.
    - SA : fond Encre, texte blanc.

**Bloc « Le jour J »**
- Conteneur : fond `#141210`, texte blanc, rayon 20, padding 18, colonne, gap 12.
- Titre h2 « Le jour J » : 16 px, graisse 700, blanc.
- Rangée de 3 boutons `Expanded`, gap 8, hauteur 42, rayon 12, texte 14 px :
  - **J'arrive** : fond Braise, texte Encre, graisse 650.
  - **+10 min** : fond transparent, bordure 1 px `#3A3632`, texte blanc, graisse 600.
  - **+20 min** : même style que +10 min.
- États : pas d'état actif/sélectionné dans la maquette. Un choix (J'arrive) passerait en plein Braise, les autres restant en contour (**À valider**).

**Carte « trajet »**
- Rangée, gap 14, alignement centre, padding 16, rayon 18, bordure 1 px `#ECEAE6`.
- Icône `route` 26 px, trait 1.75, Encre.
- Colonne (Expanded) :
  - Titre h2 « 12 min en métro » : 16 px, graisse 700.
  - Sous-titre 13 px Gris : « Départ conseillé à 20 h 15 · 12 °C, sec ».

---

## 5. Mobile — Groupe et dépenses (Aperçu / Dépenses / Carnet, solde, dernières dépenses)

**Fond** : blanc. Nav basse fixe (voir section 6), onglet « Groupes » actif.

**Structure**
1. Padding haut 52, latéraux 20, bas 100. Colonne, gap 20.
2. Ligne haut : retour (gauche), « Inviter » (droite).
3. Identité du groupe : tuile + nom + méta.
4. Segment Aperçu / Dépenses / Carnet.
5. Carte solde (fond Encre).
6. Section « Dernières dépenses ».
7. Nav basse fixe.

**Ligne haut**
- Retour : 44 × 44 rond, bordure 1 px `#ECEAE6`, `chevron-left` 20 px, trait 2, Encre.
- « Inviter » : hauteur 40, padding horizontal 16, rayon 999, bordure 1 px `#E4E1DC`, fond blanc, 14 px graisse 600, Encre.

**Identité**
- Rangée, gap 14, centre.
- Tuile : 56 × 56, rayon 18, fond Braise, lettre « J » Bricolage 750, 24 px, Encre, centrée.
- Titre « Les Jeudis » : Bricolage 700, 30 px, `letter-spacing -0.04em`, interligne 1.05.
- Méta : 14 px, Gris, « 6 membres · 14 sorties ».

**Segment d'onglets** (`nav`)
- Conteneur : padding 4, rayon 14, fond `#F6F4F0`, gap 4.
- Trois `Expanded`, hauteur 40, rayon 10 :
  - Sélectionné (`aria-current`) : fond blanc, ombre `0 1px 3px rgba(20,18,16,0.12)`, 14 px graisse 650, Encre.
  - Repos : transparent, 14 px graisse 400, `#4A4641`.
- Libellés : « Aperçu », « Dépenses » (sélectionné), « Carnet ».

**Carte solde**
- Fond Encre, rayon 22, padding 20, colonne, gap 14. Texte blanc.
- Label h2 « Votre solde dans le groupe » : 14 px, graisse 500, `#B5B0A9`.
- Montant « −22,00 € » (signe moins typographique U+2212) : Bricolage 700, 40 px, `letter-spacing -0.04em`, interligne 1.1, blanc.
- Phrase : 14 px, `#D6D2CC` : « Vous devez 22 € à Léa pour le bowling ».
- Bouton « Régler Léa » : hauteur 46, rayon 12, fond Braise, texte Encre 15 px graisse 650, pleine largeur.
- **À valider** : hauteur 46 < 48 dp.

**Section « Dernières dépenses »**
- Ligne titre : `space-between`, `baseline`, marge basse 6.
  - h2 « Dernières dépenses » : 17 px, graisse 700.
  - Bouton « + Ajouter » : hauteur 36, padding 0, texte 14 px graisse 650, couleur `accentInk` `#A5391F`. Le « + » est un caractère, pas une icône (**À valider** : passer en icône `plus` 16 px).
- Liste : chaque ligne est une rangée.
  - Padding 12 haut/bas, gap 12, centre.
  - Bordure basse 1 px `#F0EEEA` (absente sur la dernière ligne).
  - Tuile d'icône : 40 × 40, rayon 12, fond `#F6F4F0`, icône 20 px, trait 1.75, Encre, centrée.
  - Texte (Expanded) :
    - Titre : 15 px graisse 650.
    - Méta : 13 px Gris (« Payé par Léa · 2 oct. »).
  - Montant à droite : 15 px graisse 650, Encre.

| Ligne | Icône (approx. Lucide) | Méta | Montant |
|---|---|---|---|
| Pistes de bowling | `circle-dot` (**glyphe maquette custom** : cercle + 3 points) | Payé par Léa · 2 oct. | 96,00 € |
| Boissons | `martini` (approx., verre à cocktail) | Payé par Hugo · 2 oct. | 36,00 € |
| Pique-nique | `utensils` (approx., fourchette-couteau) | Payé par vous · 24 août | « Réglé » 15 px graisse 650, `#4A4641` |

**États**
- Onglet actif : fond blanc + ombre légère + graisse 650.
- Ligne « Réglé » : texte gris au lieu d'un montant.

---

## 6. Barre de navigation basse (Sorties, Groupe)

- Conteneur : `position bottom 0`, hauteur 84, fond blanc, filet haut 1 px `#F0EEEA`, padding haut 8, `box-sizing: border-box`, alignement `space-around`, items en haut.
- Item (5 entrées) : largeur 64, colonne, centre, gap 3, libellé 11 px.
  - Repos : icône 24 px, trait 1.75, `#6B6660` ; libellé 11 px, graisse 400, `#6B6660`.
  - Actif (`aria-current`) : icône 24 px, trait 1.9, Encre ; libellé 11 px, graisse 650, Encre.
- Bouton central « + » : 52 × 52 rond, fond Braise, marge haute -4 ; icône `plus` 24 px, trait 2.3, Encre ; label « Nouvelle sortie ».

| Entrée | Icône (Lucide) | Taille / trait |
|---|---|---|
| Accueil | `house` | 24 / 1.75 |
| Sorties | `calendar` | 24 / 1.75 (1.9 actif) |
| + (Nouvelle sortie) | `plus` | 24 / 2.3 |
| Groupes | `users-round` | 24 / 1.75 (1.9 actif) |
| Profil | `user` | 24 / 1.75 |

- Note : la maquette utilise des tracés custom proches de ces icônes. Remplacer par Lucide (brief : icônes Lucide).

---

## 7. Icônes (inventaire complet)

| Écran | Rôle | Icône (Lucide) | Taille | Trait | Couleur |
|---|---|---|---|---|---|
| Ce soir | Retour | `chevron-left` | 20 | 2 | Encre |
| Ce soir | Ajouter ami | `plus` | 18 | 2 | Encre |
| Nouvelle | Fermer | `x` | 18 | 2.2 | Encre |
| Nouvelle | CTA | `arrow-right` | 18 | 2 | Encre (currentColor) |
| Vote | Retour | `chevron-left` | 20 | 2 | Encre |
| Vote | Pas pour moi | `x` | 28 | 2.2 | Encre |
| Vote | Info | `info` | 20 | 2 | Encre |
| Vote | Partant | `check` | 30 | 2.4 | Encre |
| Sortie | Retour | `chevron-left` | 20 | 2 | Encre |
| Sortie | Partager | `share` | 20 | 1.9 | Encre |
| Sortie | Trajet | `route` | 26 | 1.75 | Encre |
| Groupe | Retour | `chevron-left` | 20 | 2 | Encre |
| Groupe | Tuile dépense (bowling) | `circle-dot` (approx.) | 20 | 1.75 | Encre |
| Groupe | Tuile dépense (boissons) | `martini` (approx.) | 20 | 1.75 | Encre |
| Groupe | Tuile dépense (pique-nique) | `utensils` (approx.) | 20 | 1.75 | Encre |
| Nav | Accueil / Sorties / Groupes / Profil | `house` / `calendar` / `users-round` / `user` | 24 | 1.75 (1.9 actif) | `#6B6660` / Encre |
| Nav | Nouvelle | `plus` | 24 | 2.3 | Encre |

---

## 8. Points à valider (décisions)

1. **Ombres** : carte Vote `0 20px 48px` et boutons Vote `0 6px 18px` : contraires au brief (« ombres lourdes »). Proposition : bordure ou ombre très légère.
2. **Cibles tactiles < 48 dp** : boutons retour et fermer (44), « Partager » (44), « Itinéraire » / « Calendrier » (44), « Régler Léa » (46), « + Ajouter » (36), segments (40), boutons Jour J (42). Proposition : zone de touche 48 dp, visuel inchangé.
3. **Couleurs hors palette** : listées en section 0. Proposition : `#F0EEEA` → Ligne `#ECEAE6` ; `#E4E1DC` → garder pour les bordures de chip mais vérifier le contraste non-texte 3:1 (sinon Ligne foncée ou fond) ; placeholders de vignettes → valider.
4. **Braise douce** : la maquette calcule `#FDEAE6`, la DA impose `#FDEBE6`. Garder la DA.
5. **Poids 650** : choisir 600 ou 700 pour Instrument Sans (le fichier est variable 400–700, mais on ne charge que les poids statiques de `assets/fonts/`).
6. **Titre de confirmation** : pas de point orange final dans la maquette, alors que le brief le prévoit. À confirmer.
7. **Vote, geste** : rotation, teinte et seuil de glissement non définis dans la maquette.
8. **Sortie, Jour J** : la maquette a J'arrive / +10 / +20 (distinct du RSVP Je viens / Peut-être / Non). À confirmer que les deux blocs sont bien voulus.
9. **Accent unique** : sur Groupe, la tuile « J », « Régler Léa » et « + Ajouter » utilisent Braise ou Braise texte. La DA demande une seule action principale par écran : « Régler Léa » reste l'action principale, « + Ajouter » peut passer en Encre.
10. **Bricolage opsz** : la maquette utilise l'axe optique ; Flutter utilise les fichiers statiques fournis.
