# Patches Keepcool

Cette documentation regroupe les détails spécifiques aux patches Keepcool distribués par ce dépôt.

## Compatibilité

Les patches ci-dessous ciblent actuellement :

- **Application :** Keepcool
- **Version :** 1.8.21
- **Package :** `fr.keepcool.memberapp`

Les fingerprints sont conçus pour refuser l'application du patch si la structure attendue n'est pas retrouvée de manière suffisamment précise.

## Keepcool: allow plus in email

### Fonction

Keepcool 1.8.21 refuse certaines adresses pourtant valides, par exemple `prenom+keepcool@gmail.com`. Le formulaire désactive le bouton de connexion avant même d'envoyer la demande au serveur.

Ce patch ajoute `+` aux caractères autorisés dans la partie locale de l'adresse, avant `@`.

Il ne réécrit pas l'adresse : `prenom+keepcool@gmail.com` reste exactement cette adresse lors de la connexion.

### Implémentation

Le patch remplace la constante de regex utilisée par le validateur. Il ne désactive pas la validation et ne modifie pas le code réseau.

La méthode observée dans Keepcool 1.8.21 est obfusquée, mais le patch ne dépend pas de son nom. Son fingerprint s'appuie notamment sur :

- la signature `(Ljava/lang/String;)Z` ;
- la regex attendue ;
- les appels à `Pattern.compile`, `Pattern.matcher` et `Matcher.matches`.

La correspondance doit être unique.

### Validation

Les tests couvrent les adresses avec `+`, plusieurs adresses invalides et le comportement historique sans `+`.

Le patch a aussi été appliqué au véritable APK Keepcool 1.8.21 et testé avec succès sur téléphone.

## Keepcool: booking availability dots

### Fonction

Ce patch affiche progressivement une **pastille verte** sur les dates du calendrier qui possèdent au moins un créneau réservable avec une place disponible.

Le marqueur d'une date déjà réservée conserve sa priorité visuelle sur la pastille de disponibilité.

Le résultat est recalculé lorsque le contexte de réservation change, notamment lors des changements de club, catégorie ou plage horaire.

### Implémentation

Le patch utilise une extension Morphe Java dédiée, `keepcool-availability.mpe`.

Les hooks capturent le contexte des appels de recherche de créneaux et associent les cellules recyclées du calendrier à leur date. Le binding précédent est supprimé lorsqu'une cellule recyclée représente une case vide afin d'éviter les pastilles résiduelles.

Les dates affichées sont normalisées vers `yyyy-MM-dd` avant comparaison avec les données de réservation.

La logique runtime utilise :

- des références faibles pour les objets Android conservés ;
- un cache de disponibilité ;
- une concurrence limitée à trois recherches simultanées ;
- uniquement des appels de lecture.

La disponibilité est déterminée à partir des informations retournées par l'API, notamment en vérifiant qu'un créneau dispose encore d'une place.

### Validation

La validation a confirmé :

- les hooks attendus dans les méthodes de recherche de créneaux et de rendu des cellules ;
- la conservation du flux de contrôle original ;
- l'absence de suppression de classes applicatives ;
- la reconstruction complète des DEX ;
- le comportement de l'API avec une catégorie réelle non vide ;
- l'absence d'appel mutant ;
- l'absence de pastilles résiduelles lors du recyclage des cellules ;
- le fonctionnement réel sur téléphone dans l'écran Small Groups.

## Installation et précautions

Un XAPK peut contenir plusieurs APK : le fichier de base n'est pas forcément installable seul. Utilisez un mode de traitement compatible avec les splits.

L'application modifiée est re-signée. Android peut demander de désinstaller l'application d'origine avant l'installation, ce qui supprime ses données locales et impose généralement une reconnexion.

Les patches sont volontairement limités aux versions explicitement déclarées compatibles. Une nouvelle version de Keepcool peut nécessiter une nouvelle validation des fingerprints avant d'être supportée.
