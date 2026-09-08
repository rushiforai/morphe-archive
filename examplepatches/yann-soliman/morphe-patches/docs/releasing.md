# Publier une release

La release se lance localement avec la configuration semantic-release du template Morphe. Il n'y a pas de workflow GitHub Actions activé dans ce dépôt.

Prérequis : JDK 21, Node.js 24 LTS et npm 11.5.1 ou plus récent (requis par les dépendances de release), Python 3, jq et un accès GitHub avec les droits de publication sur ce dépôt et `read:packages`.

Sur une copie propre du dépôt :

```bash
npm ci
export GITHUB_TOKEN="$(env -u GITHUB_TOKEN -u GH_TOKEN gh auth token)"
export GITHUB_ACTOR="$(env -u GITHUB_TOKEN -u GH_TOKEN gh api user --jq .login)"
export GITHUB_REPOSITORY=yann-soliman/morphe-patches
export GITHUB_REF_NAME="$(git branch --show-current)"
npx semantic-release --no-ci
unset GITHUB_TOKEN
```

Ne lancez pas ces commandes avec `set -x` : cela afficherait le token.

`main` produit les versions stables ; `dev` produit les préversions. La configuration officielle synchronise aussi les releases stables vers `dev`. Utiliser des commits `fix:` pour les correctifs et `feat:` pour les nouveaux patches. Un commit de documentation seul ne déclenche pas de release.

semantic-release met à jour `gradle.properties`, `CHANGELOG.md`, `patches-bundle.json` et `patches-list.json`, puis publie le fichier `.mpp`. Ne pas modifier ces fichiers générés à la main. Le README reste rédigé manuellement : il ne contient pas de bloc de liste automatique.

Après une release, vérifier que `patches-bundle.json` pointe vers le fichier `.mpp` de cette release, que son téléchargement fonctionne et que le bundle est lisible avec Morphe Desktop ou Manager.

Les versions des dépendances et le wrapper Gradle proviennent du template Morphe. Conserver LICENSE et NOTICE lors des mises à jour.
