# Yann’s patches

Des patches Android à appliquer avec [Morphe](https://morphe.software/).

Ce projet est indépendant de Morphe et des éditeurs des applications concernées. Aucun APK n'est distribué ici.

## Ajouter à Morphe

[Ajouter Yann’s patches à Morphe](https://morphe.software/add-source?github=yann-soliman/morphe-patches)

Ouvrez ce lien sur votre téléphone avec Morphe installé, puis confirmez l'ajout de la source. Vous pouvez aussi télécharger le fichier `.mpp` depuis la [dernière release](https://github.com/yann-soliman/morphe-patches/releases/latest) et l'importer manuellement.

Ajouter cette source n'applique pas tous les patches : vous choisissez ceux à utiliser pour votre application.

## Patches disponibles

| Application | Patch | Fonction |
| --- | --- | --- |
| Leboncoin 100.124.1–100.125.0 | **Leboncoin: remove ads** | Utilise le mode sans publicité intégré pour supprimer bannières, publicités natives et interstitiels. |
| Leboncoin 100.125.0 | **Leboncoin: privacy mode** | Bloque la télémétrie comportementale Firebase, Piano, Adjust, mParticle et Datadog sans désactiver les services nécessaires au fonctionnement de l'application. |
| Leboncoin 100.125.0 | **Leboncoin: persistent search filters** | Conserve les critères de la recherche précédente lors de l'ouverture d'une nouvelle recherche. |
| METEO CONSULT 1.1.4 | **Meteo Consult: remove ads and subscription prompts** | Supprime les publicités et les sollicitations automatiques d'abonnement, y compris en fin de prévisions. |
| METEO CONSULT 1.1.4 | **Meteo Consult: disable video autoplay** | Ouvre les vidéos météo en pause et conserve la lecture manuelle. |
| Keepcool 1.8.21 | **Keepcool: allow plus in email** | Autorise les adresses contenant un `+` avant le `@` sans modifier l'adresse envoyée au serveur. |
| Keepcool 1.8.21 | **Keepcool: booking availability dots** | Affiche une pastille verte sur les dates ayant au moins un créneau avec une place disponible. |

Le détail du fonctionnement, de l'implémentation et des validations des patches Keepcool est disponible dans [leur README dédié](patches/src/main/kotlin/io/github/yannsoliman/patches/keepcool/README.md).

## Construire le bundle

Il faut un JDK 21 et un accès GitHub Packages avec le droit `read:packages`.

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

Les sources sont rangées par application sous `patches/src/main/kotlin/`. Chaque correctif a son propre nom, sa liste de versions compatibles et ses tests. Les nouveaux patches sont distribués dans le même bundle ; le lien d'ajout à Morphe ne change pas.

La publication utilise la configuration semantic-release du [template officiel](https://github.com/MorpheApp/morphe-patches-template). Elle génère le bundle, la liste des patches et les métadonnées utilisées par Morphe. Voir [la procédure de release](docs/releasing.md).

## Licence

GPLv3, avec les conditions du template d'origine détaillées dans [NOTICE](NOTICE). Voir [LICENSE](LICENSE).
