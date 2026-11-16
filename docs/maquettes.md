# Maquettes Hangster : extraction

Source : canvas « Hangster — Maquettes » (artifact `3gvGEqu3HFDz2KmnLSYLpa`, version 1794820055-6bcc), type Design. Extraction en lecture seule. Rien n'a été modifié ni publié.

Limite : les artboards Accueil, Main, Landing, Groupe, Profil, Onboarding, NouvelleSortie, Propositions et SortieConfirmee ont été lus par leurs titres, boutons et libellés principaux. Le détail des interactions fines n'a pas été relu ligne à ligne.

## 1. Écrans

### Identité (planches de travail, pas des écrans de l'app)
| Fichier | Titre | Contenu |
|---|---|---|
| Main.dc.html | Logo et identité | Planche d'identité, palette et logo de base |
| Logos.dc.html | 33 pistes de logo | 33 propositions de logo (hamac, épingle, cercle d'amis, soleil, lune, boussole, ticket, néon, etc.) |
| Finalistes.dc.html | Finalistes 07, 17, 18 | Trois pistes déclinées : fonds sombre et « Braise », favicon 16 px, chargements animés |
| Fusion.dc.html | Logo fusionné soleil + point | Logo animé : le point final saute par-dessus le nom et devient soleil. Variantes fond blanc, sombre, Braise, favicon, chargement |

### Desktop, pages publiques
| Fichier | Titre | Rôle |
|---|---|---|
| Landing.dc.html | Accueil public | Page d'accueil marketing : « Trois étapes, zéro tableur partagé », fonctionnalités (Le bon créneau, Mode « Ce soir », Dépenses partagées, Carnet de sorties), FAQ, CTA final |
| Connexion.dc.html | Connexion par invitation | Rejoindre un groupe : Google, Apple, e-mail + mot de passe, aperçu de l'invitation (groupe Les Jeudis, vote ouvert) |
| Onboarding.dc.html | Onboarding, goûts | Étape 2 sur 3 : « Qu'est-ce qui vous fait sortir ? », budget en segments (moins de 15 €, 15 à 30 €, 30 à 50 €) |

### Desktop, application (sidebar commune)
| Fichier | Titre | Rôle |
|---|---|---|
| Accueil.dc.html | Tableau de bord | « Bonsoir Sacha », recherche, prochaine sortie (Le Phare Bleu, 5 sur 6), vote en cours, disponibilités, idées pour le week-end, « Libres ce soir », activité récente |
| NouvelleSortie.dc.html | Nouvelle sortie | Formulaire : groupe, critères (ambiance, jeux, trajet), carte de zone de recherche autour du point équitable, résumé |
| Propositions.dc.html | Propositions et vote | « Quatre idées pour samedi » : carte des propositions et positions des membres, vote |
| SortieConfirmee.dc.html | Sortie confirmée | « C'est calé : Le Phare Bleu ». Présence (4 sur 6), réponse « Votre réponse », avant la soirée, petits mots, itinéraire (12 min en métro), jour J, météo, dépenses |
| Groupe.dc.html | Groupe Les Jeudis | 6 membres, « Inviter », ce qui plaît au groupe (bars, jeux, restaurants, karaoké, plein air, concerts), rendez-vous régulier (1er jeudi du mois, activé), dernières sorties, membres, lien d'invitation (valable 7 jours, validation des arrivants), habitudes |
| FicheLieu.dc.html | Fiche lieu | La Table Ronde : photos, « Pourquoi pour Les Jeudis », en bref (horaires, groupes jusqu'à 10, réservation, accès), avis d'amis, plan, trajets des membres, lieux similaires. CTA « Proposer au groupe » |
| Carnet.dc.html | Carnet et dépenses | Sorties passées (filtre par groupe), photos, notes, comptes du groupe (qui doit quoi), « Régler », adresses fétiches |
| Profil.dc.html | Profil et confidentialité | Sacha Dupont : envies (goûts), notifications, confidentialité, « Mes données » |

### Mobile (390 × 844, rayon 44)
| Fichier | Titre | Rôle |
|---|---|---|
| MobileAccueil.dc.html | Accueil | « Bonsoir Sacha », prochaine sortie, vote, idées, barre d'onglets : Accueil, Sorties, Groupes, Profil |
| MobileCeSoir.dc.html | Ce soir | « Qui est libre » (Inès, Malik, Chloé), idées à moins de 15 min, choix d'un lieu |
| MobileNouvelle.dc.html | Nouvelle sortie | Étape 1 sur 2 : choix du groupe, du créneau (Sam. 25 / Ven. 24 / Jeu. 23 / Dim. 26) avec disponibilité par personne, envie (Pour discuter / Jeux), contrainte de trajet (Hugo ≤ 20 min) |
| MobileVote.dc.html | Vote | Carte de proposition 2 sur 4 (Ping Club Oberkampf), « Pas pour moi » / « Partant », fiche lieu, swipe à droite pour partant |
| MobileSortie.dc.html | Sortie confirmée | « C'est calé », adresse, « Je viens » / « Peut-être », 4 sur 6, jour J (« J'arrive », +10 / +20 min), itinéraire, calendrier, partage |
| MobileGroupe.dc.html | Groupe et dépenses | Onglets Aperçu / Dépenses / Carnet. Solde (−22,00 € à Léa), dernières dépenses, « + Ajouter », « Régler Léa » |

Comptage : 21 artboards dans canvas.json (4 planches d'identité, 11 écrans desktop dont 3 publics et 8 app, 6 écrans mobiles).

## 2. Navigation

Parcours public :
- Landing (accueil public) vers Connexion (invitation). Connexion mène à Accueil après connexion, à Onboarding pour créer un compte, et à Propositions pour « Continuer sans compte » (vote seul).
- Onboarding (3 étapes) vers Accueil.

Sidebar desktop (commune à toutes les pages app) :
- Accueil, Mes sorties (SortieConfirmee), Groupes (Groupe), Explorer (FicheLieu), Carnet.
- Bouton « Nouvelle sortie » vers NouvelleSortie.
- Pied de sidebar : profil (vers Profil).

Enchaînement d'une sortie :
- Explorer / FicheLieu, « Proposer au groupe », vers NouvelleSortie, vers Propositions (vote), vers SortieConfirmee.
- Carnet vers FicheLieu (adresses fétiches et sorties passées).
- Groupe vers Carnet (« Ouvrir le carnet », dernières sorties).

Mobile :
- Barre d'onglets : Accueil, Sorties, (+) Nouvelle sortie, Groupes, Profil.
- Accueil vers Ce soir, vers Vote, vers Sortie.
- Nouvelle sortie : Fermer ferme la modale, puis l'étape 1 vers l'étape 2, puis proposition.
- Vote vers fiche lieu (« Voir la fiche du lieu »).
- Groupe : onglets internes Aperçu / Dépenses / Carnet.

## 3. Fonctionnalités clés (par thème)

- Création de sortie : choix du groupe, du créneau (disponibilité de chaque membre), de l'envie, de la contrainte de trajet, avec point équitable calculé.
- Vote : propositions de lieux, « Partant » / « Pas pour moi », swipe mobile, clôture (« clôture dans 5 h »).
- Disponibilités : réponse par membre (« 6 réponses sur 9 »).
- Confirmation : présence (« 4 sur 6 viennent »), itinéraire, météo, calendrier, partage, réponse « Je viens » / « Peut-être », retard (« J'arrive », +10 / +20 min).
- Groupes : membres, invitation par lien (7 jours, validation manuelle), rendez-vous régulier automatique, préférences du groupe.
- Explorer : fiches lieux (prix, horaires, accès, avis d'amis, plan, trajets des membres, lieux similaires).
- Carnet et dépenses : sorties passées avec photos et notes, comptes du groupe, soldes, « Régler », historique.
- Profil : envies, notifications, confidentialité, export/suppression des données (« Mes données »).
- Onboarding : préférences de sortie (budget par segments).

## 4. Composants UI récurrents

- Sidebar desktop 240–272 px, fond #FBFAF8, items 42 px, rayon 10 px, actif fond #F0EEEA en gras.
- Logo « hangster » : deux barres verticales arrondies noires et un cercle couleur accent (le « soleil »), mot en Bricolage Grotesque 750.
- Bouton primaire : pleine largeur 46–54 px, rayon 12–14 px, fond accent ou ink #141210.
- Bouton secondaire : contour #E4E1DC, fond blanc, rayon 999 px (pill).
- Chips de filtre : pill 40 px (ex. filtre par groupe dans Carnet).
- Cartes : rayon 16–24 px, bordure #ECEAE6 ou fond #F6F4F0.
- Avatars : cercles 28–48 px avec initiales (fonds #141210, #E9E5DF, #D9D4CC, accent doux).
- Barres de progression : 8 px, rayon 99 px, fond #F0EEEA, remplissage ink ou accent (trajets).
- Carte / plan : SVG stylisé (rues blanches sur fond #F3F1EC), point accent.
- Segmented control : budget (3 segments).
- Barre d'onglets mobile (4 ou 5 entrées) et bouton (+) central.
- Modale mobile : rayon 44 px, bouton Fermer.
- Figures et citations : cartes avec avatar initiales et légende.
- Champs : hauteur 52 px, rayon 14 px, bordure #E4E1DC, focus 2 px ink.

## 5. Palette, typo, style

Couleurs (neutres) :
- Ink #141210 (texte, boutons noirs, logo)
- Blanc #FFFFFF
- Texte secondaire #4A4641 et muted #6B6660 (contraste visé 4,5:1)
- Bordures #ECEAE6, #E4E1DC, #F0EEEA
- Surfaces #F6F4F0, #FBFAF8 (sidebar), #F3F1EC
- Photos placeholders : #EDE6DD, #E6E1D8, #E3E9E4, #E8E5EE, #DED8CD, #D9D4CC

Couleur d'accent (paramètre éditable) :
- Défaut : #F2542D (« Braise », orange)
- Alternatives proposées : #7C4DFF (violet), #E8A317 (ambre), #1F7A5A (vert)
- Dérivés : accent doux = mélange 88 % blanc ; accent encre = mélange 32 % noir (pour texte sur fond clair)

Typographie :
- Titres : Bricolage Grotesque, graisse 700 (ou 750 pour le logo), interlettrage −0,04 em, interlignage 1,0 à 1,1. Tailles : 28–64 px.
- Corps : Instrument Sans, 400 à 700. Taille 15–16 px, 13–14 px pour labels et métadonnées.
- Majuscules d'en-tête de section : 13 px, graisse 650, interlettrage +0,06 em.

Style :
- Ton clair, chaleureux, minimal : fonds blancs, beaucoup d'espace, peu de bordures.
- Coins arrondis partout (12–28 px, pills 999 px). Ombres douces sur les cartes flottantes.
- Pas d'emoji dans l'UI (icônes SVG inline à trait fin 1,75).
- Accessibilité : boutons et liens réels, aria-label sur les icônes seules, cibles tactiles ≥ 44 px.

Dimensions de référence :
- Desktop : 1440 px de large, pages app en pleine largeur (flex, sans largeur fixe)
- Mobile : 390 × 844

## 6. Données fictives (mock) à ne pas prendre pour des contenus réels

Utilisateur : Sacha Dupont. Groupes : Les Jeudis (6 membres), Coloc' Ménilmontant, Équipe foot du dimanche. Membres : Léa Martin (organisatrice), Hugo Bernard, Inès Haddad, Malik Diallo, Chloé Lefèvre. Lieux : Le Phare Bleu, Bowling des Quais, Karaoké Néon 7, La Table Ronde, Ping Club Oberkampf, Guinguette du Canal, Quiz du Mardi. Prix en euros.

## 7. Points à valider (ce que je n'ai pas tranché)

- Logo retenu : les fichiers indiquent trois finalistes (07, 17, 18) et une fusion « soleil + point ». Le choix final n'est pas explicite dans le canvas.
- Navigation mobile : la barre d'onglets diffère selon les écrans (4 entrées dans MobileAccueil, 5 avec le bouton central dans MobileSortie). À unifier.
- Périmètre : onboarding en 3 étapes annoncé, seule l'étape 2 est maquettée.
