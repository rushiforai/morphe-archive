# Pastille de disponibilité Keepcool — reprise, résultat réel

## Statut

**La nouvelle pastille verte n'est pas implémentée. Aucun candidat « disponibilités » n'a été produit.**
Le correctif J+30 confirmé sur téléphone n'a pas été modifié : les SHA-256 de son source,
du bundle dans `dist/` et des quatre fichiers de tests/documentation préexistants ont été
comparés avant/après et sont identiques.

L'analyse établit un blocage pour une simple modification locale de couleur : les données de
places libres pour chaque date affichée ne sont pas présentes dans le flux du calendrier.
Cela ne prouve pas que la fonctionnalité soit impossible : il faut développer un nouveau
chargement asynchrone des disponibilités par date, puis le relier au rendu. Ce travail
supplémentaire n'a pas été réalisé dans cette reprise.

## Résultats vérifiables sur le vrai APK 1.8.21

- **Orange = réservation personnelle**, pas « séance complète » :
  `m8/w0.c0()` parcourt `BookingSharedViewModel.B`, une liste de `MyBooking`, extrait la date
  de chaque `BookingSlot.startAt` et appelle `DatePickerComponent.setDateIsBooked(List<String>)`.
  Le runnable `A3/l` met à jour `Z6/c.f`; `J7/c.g()` transmet ce booléen à
  `CellDatePickerComponent.n(Z, Z6/f)`, qui pilote la visibilité de l'image.
- `Z6/c` ne contient que deux chaînes et quatre booléens (`a..f`), sans liste de séances,
  capacité ou compteur de places. Le bind de cellule ne lit ni `getReservationCount()` ni
  `getNbPlaces()`.
- **La piste `countSessionForDay` était trompeuse** : son appel applicatif est dans `u8/a`,
  coroutine du `GeolocationViewModel`, pas dans le calendrier. Le type de retour Retrofit
  est un `Integer`. Le repository construit sa requête avec `freePlace=false` et le masque
  de paramètres par défaut `0xe`. Le bit `0x4` force lui-même ce booléen à faux : modifier
  uniquement l'argument ne suffirait pas. Le comportement du serveur avec `freePlace=true`
  n'a pas été testé et ne doit pas être supposé.
- Les données utiles existent bien **dans les séances chargées** :
  `BookingSlot.getReservationCount()` et `getNbPlaces()`.
  Mais `m8/g.invokeSuspend()` appelle `findBookingSlots(...)` pour la chaîne
  `BookingSharedViewModel.y`, mise à jour par `m8/s.e()` lorsque l'utilisateur sélectionne
  une date. Ce flux ne fournit pas au picker une table des places libres pour les autres dates.
- Un nombre de séances positif ne permet pas de déduire une place libre. Le diagnostic
  exécute un contre-exemple logique explicite : une séance remplie et une séance non remplie
  donnent chacune un compteur de séances égal à un. **Ce ne sont pas des réponses API.**

Le script reproductible `tests/inspect_availability_contract.py` contrôle ces contrats
sur les fichiers Smali et produit les chemins, lignes d'ancrage et hashes de ses preuves :

```bash
python3 tests/inspect_availability_contract.py /chemin/apk-decode /chemin/rapport.json
```

Ce script est un diagnostic statique ciblé, **pas un test de réussite de la fonctionnalité**.

## Vérification du J+30 préservé

Pour écarter une régression de l'existant, le bundle a été recompilé, appliqué au véritable
APK original puis désassemblé indépendamment avec Apktool 3.0.3 :

- JDK Temurin 21.0.12.1+1, Gradle : **BUILD SUCCESSFUL**.
- Régression e-mail Java : **10 018 contrôles réussis**.
- Morphe : application du calendrier seul, mode **FULL**, APK **non signé**.
- **6 tests J+30 verts** sur source + DEX final; **2 régressions rouges attendues** sur l'ancien
  DEX v1.1.0. Ce RED/GREEN concerne uniquement le J+30 existant, pas la future pastille.
- Vérification des bornes pour chaque jour de la semaine : succès.
- **13 107 classes** conservées; seules `DatePickerComponent` et `m8/w0` changent;
  82 instructions injectées, 4 chemins `throw null` préservés, CFG d'origine préservé.
- Les contrats montrant l'absence de flux disponibilité dans le picker restent identiques
  sur le nouveau DEX. Aucune nouvelle exécution Android ou requête Keepcool n'a été faite.

La première tentative Gradle a échoué car le plugin exige des propriétés de registre même
hors ligne (`IllegalArgumentException` dans `SettingsPlugin.configureDependencies`).
Alternative réellement réussie, sans lire de secret ni contacter de registre :

```bash
export JAVA_HOME=/home/hermes/keepcool-morphe/tools/jdk-21.0.12.1+1
export PATH="$JAVA_HOME/bin:$PATH"
./gradlew build buildAndroid --offline --no-build-cache --rerun-tasks \
  -Pgpr.user=offline-cache-only -Pgpr.key=offline-cache-only
```

Ces valeurs sont des placeholders non secrets utilisables **uniquement hors ligne**, avec
les dépendances déjà en cache. Elles ne sont pas des identifiants d'authentification.

## Artefacts et limites

Dossier de cette reprise :
`/home/hermes/keepcool-morphe/validation-availability-resume/`

- `availability-contract.json`, `availability-contract-final-dex.json` : preuves ciblées.
- `preserved-before.json`, `preserved-after.json` : intégrité des six fichiers existants.
- `patch-result.json`, `bytecode-scope.json`, logs `red-historical-j30-only.log`,
  `green-j30-only.log`, `j30-horizon.log`, `j30-scope.log`.
- `j30-baseline-only-unsigned.apk` : **seulement J+30**, pièce de revalidation,
  pas une mise à jour disponibilité et pas un APK prêt à installer.
- `decoded/` : désassemblage indépendant de cette pièce.

Le seul candidat dans `dist/` à conserver pour l'utilisateur reste :
`dist/patches-1.1.0-j30-register-fix-candidate.mpp`
(SHA-256 `0a7dd02813189f9c191a58e7e290f86f608740a16c2844e0f3941aa004912cf5`).
Il est inchangé et **n'ajoute pas de pastille verte**.

Pour une vraie implémentation : chargement borné et annulable par date/club/filtres,
validation de la réponse avant `reservationCount < nbPlaces`, invalidation des réponses
obsolètes, distinction inconnu/erreur/complet, mise à jour des pages sur le thread UI,
et signal distinct sans écraser l'orange. Recolorer les réservations, employer seulement
le nombre de séances, ou se limiter aux dates déjà visitées ne satisfait pas la demande.

Aucun commit, publication, réservation, accès aux secrets ou remplacement du candidat
confirmé sur téléphone. Le risque préexistant de passage d'année décrit dans la note J+30
reste également hors du périmètre de cette reprise.
