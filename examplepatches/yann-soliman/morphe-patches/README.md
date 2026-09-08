# Yann’s patches

Des correctifs Android à appliquer avec [Morphe](https://morphe.software/). Le premier règle un problème de connexion dans Keepcool. D'autres pourront rejoindre ce dépôt, pour Keepcool ou pour d'autres applications.

Ce projet est indépendant de Morphe et des éditeurs des applications concernées. Aucun APK n'est distribué ici.

## Ajouter à Morphe

[Ajouter Yann’s patches à Morphe](https://morphe.software/add-source?github=yann-soliman/morphe-patches)

Ouvrez ce lien sur votre téléphone avec Morphe installé, puis confirmez l'ajout de la source. Vous pouvez aussi télécharger le fichier `.mpp` depuis la [dernière release](https://github.com/yann-soliman/morphe-patches/releases/latest) et l'importer manuellement.

Chaque patch indique les applications et versions qu'il accepte. Ajouter cette source n'applique pas tous les patches : vous choisissez ceux à utiliser pour votre application.

## Keepcool : calendrier de réservation sur 30 jours

Keepcool 1.8.21 limite son sélecteur de dates à dix dates en comptant aujourd'hui. Selon le jour de la semaine, le composant ne construit en plus que trois pages hebdomadaires. Des cours plus éloignés existent pourtant déjà dans l'API et peuvent être réservés par un compte autorisé.

Le patch **Keepcool: 30-day booking calendar** rend sélectionnables aujourd'hui et les trente jours suivants. Il ajoute les pages hebdomadaires manquantes et désactive les dates après `J+30` sur la dernière page. Il ne change ni le compte, ni l'abonnement, ni les requêtes de réservation.

Compatibilité : **Keepcool 1.8.21**, package `fr.keepcool.memberapp`. L'API a renvoyé des créneaux jusqu'à `J+29`, et une réservation à `J+14` a été confirmée côté serveur. L'affichage du calendrier patché doit encore être validé sur un appareil Android.

Le fingerprint recherche la lecture de `RoleParams.getMaxBookingVisibleDays()`, l'initialisation du `DatePickerComponent`, ses trois calendriers d'origine, `KEY_DATES` et l'adapter `ViewPager2`. Il exige une correspondance unique. Le test indépendant vérifie ensuite cinq semaines systématiques, une sixième semaine conditionnelle et exactement 31 dates sélectionnables pour chacun des sept jours possibles.

## Keepcool : accepter les adresses avec un `+`

Keepcool 1.8.21 refuse certaines adresses pourtant valides, comme `prenom+keepcool@gmail.com`. Le formulaire désactive le bouton de connexion avant même d'envoyer la demande au serveur.

Le patch ajoute `+` aux caractères autorisés dans la partie de l'adresse située avant `@`. Il conserve le reste de la validation et ne réécrit pas l'adresse : `prenom+keepcool@gmail.com` ne devient pas `prenom@gmail.com`.

Compatibilité : **Keepcool 1.8.21**, package `fr.keepcool.memberapp`. Le fonctionnement a été confirmé sur téléphone par l'utilisateur à l'origine du correctif. Les autres versions n'ont pas été testées.

Pour l'utiliser, sélectionnez **Keepcool: allow plus in email** dans Morphe, appliquez-le à votre copie de Keepcool 1.8.21 et installez le résultat. Le formulaire exige toujours un mot de passe non vide.

Quelques précautions :

- Un XAPK peut contenir plusieurs APK : le fichier de base n'est pas forcément installable seul. Utilisez un mode de traitement compatible avec les splits.
- L'application modifiée est re-signée. Android peut demander de désinstaller l'originale, ce qui supprime ses données locales et impose une reconnexion.
- Le validateur est partagé entre plusieurs endroits de l'application. Ils bénéficient tous du support de `+`. Ses autres limites, notamment sur certains noms de domaine, restent présentes.

### Ce qui change dans le code

Le patch remplace une constante de regex. Il ne désactive pas le validateur et ne touche pas au code des requêtes réseau. Les opérations de trim déjà présentes dans l'application restent en place.

La méthode observée dans cette version est `e5.b.E(String): boolean`, mais le patch ne se fie pas à ce nom obfusqué. Son fingerprint recherche la signature `(Ljava/lang/String;)Z`, la regex exacte et les appels à `Pattern.compile`, `Pattern.matcher` et `Matcher.matches`, dans cet ordre. Il exige une correspondance unique et s'arrête si elle manque ou si plusieurs méthodes correspondent.

Les tests couvrent les adresses avec `+`, des adresses invalides et la conservation du comportement sans `+`. L'application du bundle au véritable APK a aussi été vérifiée : une seule instruction fonctionnelle change, sur 13 107 classes désassemblées. Les différences de métadonnées produites par la réécriture DEX sont expliquées dans le [script de comparaison](tests/verify_bytecode.py).

Ces contrôles ne constituent pas une capture réseau. Le code d'envoi est inchangé ; le contenu d'une requête de connexion réelle n'a pas été enregistré pendant les tests de développement.

## Construire le bundle

Il faut un JDK 21 et un accès GitHub Packages avec le droit `read:packages`. Le wrapper fourni télécharge Gradle ; aucun SDK Android n'est nécessaire pour le patch actuel.

Avec GitHub CLI déjà connecté :

```bash
git clone https://github.com/yann-soliman/morphe-patches.git
cd morphe-patches
bash build-local.sh
```

Le script récupère les credentials stockés par `gh` sans les afficher. Vous pouvez aussi définir `gpr.user` et `gpr.key` dans votre fichier personnel `~/.gradle/gradle.properties`, puis lancer :

```bash
./gradlew clean build buildAndroid --no-build-cache
```

Le bundle se trouve dans `patches/build/libs/patches-<version>.mpp`.
Ne mettez jamais de token dans le dépôt.

## Ajouter un patch

Les sources sont rangées par application sous `patches/src/main/kotlin/`. Chaque correctif a son propre nom, sa liste de versions compatibles et ses tests. Les nouveaux patches seront distribués dans le même bundle ; le lien d'ajout à Morphe ne changera pas.

La publication utilise la configuration semantic-release du [template officiel](https://github.com/MorpheApp/morphe-patches-template). Elle génère le bundle, la liste des patches et les métadonnées utilisées par Morphe. Voir [la procédure de release](docs/releasing.md).

## Licence

GPLv3, avec les conditions du template d'origine détaillées dans [NOTICE](NOTICE). Voir [LICENSE](LICENSE).
