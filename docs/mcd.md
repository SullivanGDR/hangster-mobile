# MCD Hangster

Source : artifact Claude `76XMNuoDdvDCQD2RwWxnZK` (version 1, 21 octobre 2026). Modèle conceptuel de données (méthode Merise), correspondant au schéma créé par la première migration de `hangster-api`.

Annonce : 9 entités, 14 associations, 13 tables en base (chiffre indiqué par le MCD, non vérifié ici).

Remarques générales :
- Les types de données ne figurent pas dans le MCD (aucun type indiqué pour les attributs).
- Les clés primaires sont les attributs `id_*` (soulignés dans le schéma). Les clés étrangères ne sont pas représentées : elles découlent des associations.
- Convention de cardinalité : elle se lit du côté de l'entité. Ex. `UTILISATEUR 0,n — OUVRIR — JETON_SESSION 1,1` signifie : un jeton de session est ouvert par exactement un utilisateur, un utilisateur a 0 à n jetons.

## 1. Entités et attributs

### JETON_SESSION
- **id_jeton** (clé primaire)
- famille
- empreinte
- expire_le
- renouvelé_le
- révoqué_le

### CATÉGORIE
- **id_categorie** (clé primaire)
- code
- libellé

### LIEU
- **id_lieu** (clé primaire)
- nom
- position
- adresse
- ville
- gamme_prix
- horaires
- site_web
- source
- id_source
- vecteur

### UTILISATEUR
- **id_utilisateur** (clé primaire)
- e_mail
- nom_affiché
- empreinte_mdp
- e_mail_vérifié_le
- actif
- zone_départ
- budget_max
- vecteur_goûts
- créé_le

### PROPOSITION
- **id_proposition** (clé primaire)
- rang
- score
- trajet_max_min
- justification

### JETON_EMAIL
- **id_jeton** (clé primaire)
- usage
- empreinte
- expire_le
- utilisé_le

### SORTIE
- **id_sortie** (clé primaire)
- titre
- demande
- débute_le
- budget_max
- statut
- fin_du_vote

### GROUPE
- **id_groupe** (clé primaire)
- nom
- créé_le

### INVITATION
- **id_invitation** (clé primaire)
- empreinte
- expire_le
- révoquée_le

## 2. Associations

Format : `ENTITÉ (cardinalité) — ASSOCIATION [attributs] — ENTITÉ (cardinalité)`

| # | Association | Entité A (card. côté A) | Entité B (card. côté B) | Attributs |
|---|---|---|---|---|
| 1 | OUVRIR | UTILISATEUR (0,n) | JETON_SESSION (1,1) | - |
| 2 | AIMER | UTILISATEUR (0,n) | CATÉGORIE (0,n) | - |
| 3 | CLASSER | CATÉGORIE (0,n) | LIEU (1,1) | - |
| 4 | CONCERNER | LIEU (0,n) | PROPOSITION (1,1) | - |
| 5 | VOTER | UTILISATEUR (0,n) | PROPOSITION (0,n) | voté_le |
| 6 | CONTENIR | SORTIE (0,n) | PROPOSITION (1,1) | - |
| 7 | RETENIR | SORTIE (0,1) | PROPOSITION (0,1) | - |
| 8 | DONNER_AVIS | UTILISATEUR (0,n) | SORTIE (0,n) | note, commentaire, date |
| 9 | CRÉER | UTILISATEUR (0,n) | SORTIE (0,1) | - |
| 10 | ORGANISER | GROUPE (0,n) | SORTIE (1,1) | - |
| 11 | APPARTENIR | UTILISATEUR (0,n) | GROUPE (1,n) | rôle, rejoint_le |
| 12 | RECEVOIR | UTILISATEUR (0,n) | JETON_EMAIL (1,1) | - |
| 13 | ÉMETTRE | UTILISATEUR (0,n) | INVITATION (0,1) | - |
| 14 | DONNER_ACCÈS | GROUPE (0,n) | INVITATION (1,1) | - |

Détail des relations par entité :
- **UTILISATEUR** : ouvre 0..n jetons de session (OUVRIR), aime 0..n catégories (AIMER), vote pour 0..n propositions (VOTER), donne 0..n avis (DONNER_AVIS), crée 0..n sorties (CRÉER), appartient à 0..n groupes (APPARTENIR ; côté GROUPE, chaque groupe compte 1..n membres), reçoit 0..n jetons e-mail (RECEVOIR), émet 0..n invitations (ÉMETTRE).
- **JETON_SESSION** : ouvert par exactement 1 utilisateur.
- **CATÉGORIE** : aimée par 0..n utilisateurs, classe 0..n lieux.
- **LIEU** : classé dans exactement 1 catégorie, concerné par 0..n propositions.
- **PROPOSITION** : concerne exactement 1 lieu, appartient à exactement 1 sortie (CONTENIR), peut être retenue pour 0..1 sortie (RETENIR), reçoit 0..n votes (VOTER).
- **SORTIE** : contient 0..n propositions, retient au plus 1 proposition (RETENIR), reçoit 0..n avis, a 0..1 créateur (CRÉER), appartient à exactement 1 groupe (ORGANISER).
- **GROUPE** : organise 0..n sorties, compte 1..n membres (APPARTENIR), donne accès à 0..n invitations (DONNER_ACCÈS).
- **JETON_EMAIL** : reçu par exactement 1 utilisateur.
- **INVITATION** : donne accès à exactement 1 groupe, émise par 0..1 utilisateur.

## 3. Règles de gestion (texte du MCD)

1. Une adresse e-mail ne sert qu'à un seul compte, majuscules comprises.
2. Un groupe compte au moins un membre, avec le rôle organisateur ou membre.
3. Une sortie appartient à un seul groupe : brouillon, vote, confirmée, passée ou annulée.
4. Un même lieu n'est proposé qu'une fois par sortie.
5. Vote par approbation : un membre peut soutenir plusieurs propositions, une fois chacune.
6. Une sortie confirmée a obligatoirement une proposition retenue.
7. Un participant donne au plus un avis par sortie, noté de 1 à 5.
8. La position d'un utilisateur est une zone d'environ 500 m, jamais son adresse.
9. Supprimer son compte efface ses votes, avis, appartenances et jetons. Ses sorties et invitations restent au groupe, sans auteur.
10. Les jetons de session, d'e-mail et d'invitation ne sont jamais stockés en clair.

## 4. Points à noter (écarts entre règles et cardinalités)

Ces contraintes ne sont pas exprimées par les cardinalités du schéma. Elles devront être portées par des contraintes d'unicité ou de validation en base/code :
- Règle 4 (un lieu une seule fois par sortie) : contrainte d'unicité sur le couple (sortie, lieu), donc sur la relation PROPOSITION ↔ LIEU via CONCERNER et CONTENIR.
- Règle 5 (un vote par utilisateur et par proposition) : unicité du couple (utilisateur, proposition) sur VOTER.
- Règle 7 (un avis par utilisateur et par sortie) : unicité du couple (utilisateur, sortie) sur DONNER_AVIS.
- Règle 6 (sortie confirmée avec proposition retenue) : la cardinalité RETENIR est 0,1 ; l'obligation est une règle d'état, non structurelle.
- Règle 9 (suppression de compte) : CRÉER et ÉMETTRE sont 0,1 côté SORTIE / INVITATION, ce qui autorise l'absence d'auteur.
- Règle 1 (e-mail unique, insensible à la casse) : contrainte d'unicité sur `e_mail` à implémenter sur une valeur normalisée.
- Le schéma ne montre pas d'entité pour `source` / `id_source` du LIEU (origine des données externes) ni pour le `vecteur` (LIEU et UTILISATEUR).
- Attribut `vecteur_goûts` d'UTILISATEUR et `vecteur` de LIEU : types non précisés (probablement des embeddings).
- Les avis (DONNER_AVIS) relient UTILISATEUR et SORTIE, pas PROPOSITION.
