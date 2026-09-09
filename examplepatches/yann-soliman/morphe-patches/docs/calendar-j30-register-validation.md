# Keepcool J+30 — correction locale des registres

## Correctif candidat (non publié)

- `v9` reste la sentinelle `null` des chemins `throw v9` d'origine.
- Les boucles utilisent `v12` comme temporaire : ce registre n'est plus lu dans la suite d'origine.
- Le patch ne lit ni n'écrit `v6`, dont le type au point d'injection fusionne `Iterator` et entier.
- Le nombre de dates restant après la semaine courante est recalculé en `v13` depuis les cellules déjà construites : `31 - nombre de cellules actives`. `v13` n'est plus lu dans la suite d'origine.
- La nouvelle boucle utilise `addInstructionsWithLabels`, comme les deux boucles de désactivation.

Le correctif est volontairement limité aux défauts de registres. Il ne modifie pas les helpers calendaires, les requêtes réseau, le compte ou le patch e-mail.

## Tests reproductibles

Avec Python 3 (bibliothèque standard uniquement), depuis la racine du dépôt :

```bash
python3 -m unittest discover -s tests -p 'test_calendar_registers.py' -v

CALENDAR_DECODED=/chemin/apk-decode \
  python3 -m unittest discover -s tests -p 'test_calendar_registers.py' -v
python3 tests/verify_calendar_j30.py /chemin/apk-decode
python3 tests/verify_calendar_scope.py /chemin/original-decode /chemin/apk-decode /chemin/rapport.json
```

Les deux tests ciblant `v9` et `v6` ont été vus rouges avant chaque correction ; ils échouent aussi tous les deux sur le DEX historique v1.1.0. Les six tests sont verts sur le candidat désassemblé (aucun test ignoré).

L'interpréteur focalisé exécute les instructions injectées de la source puis celles du DEX final pour les sept jours, avec `v6` empoisonné alternativement par un objet ou un entier. Il vérifie les pages de sept colonnes, cinq ou six pages selon le jour, et les indices actifs exactement `0..30`, avec les dates passées et `J+31` et suivantes inactives lorsqu'elles sont présentes. Les appels externes `Calendar`/`q()` sont modélisés : ce n'est pas une exécution Android.

L'analyse statique fusionne tous les prédécesseurs du graphe injecté, contrôle les types des opérations, appels et branches, puis compare les destinations de branches source/DEX. La comparaison complète vérifie que les branches d'origine conservent leurs destinations ; les chemins sans troisième page continuent à éviter l'extension. Les quatre `throw v9` ne reçoivent que `const/4 v9, 0x0`.

## Exécution observée

- JDK Temurin **21.0.12.1+1** ; `./gradlew build buildAndroid --no-build-cache --rerun-tasks` : **BUILD SUCCESSFUL**.
- Régression Java e-mail : **10 018 contrôles réussis**.
- Application du calendrier seul, mode `FULL`, au véritable APK **fr.keepcool.memberapp 1.8.21** : succès Morphe, aucune erreur de patch.
- Désassemblage de l'original et du candidat avec Apktool **3.0.3**.
- **13 107 classes** conservées ; seules `DatePickerComponent` (82 instructions injectées) et `m8/w0` (constante 31) changent fonctionnellement. Les helpers du picker restent inchangés.

Bundle local :

`dist/patches-1.1.0-j30-register-fix-candidate.mpp`

SHA-256 : `0a7dd02813189f9c191a58e7e290f86f608740a16c2844e0f3941aa004912cf5`.

Dossier de preuves de cette exécution :

`/home/hermes/keepcool-morphe/validation-j30-register-fix/`

Il contient le résultat Morphe, les logs RED/GREEN, le rapport de comparaison, le manifeste SHA-256, les désassemblages et l'APK candidat **non signé**. Ce dernier est une pièce de validation, pas un APK prêt à installer.

## Limites et anomalie distincte découverte

- Aucun appareil, `adb`, `dalvikvm` ou `dex2oat` disponible : l'absence de `VerifyError`, l'ouverture de Small Groups et la navigation sur téléphone restent à confirmer. Aucun test réseau ni aucune réservation n'a été effectué.
- Un diagnostic supplémentaire sur le vrai `java.util.Calendar` du JDK révèle un **risque préexistant de changement d'année de semaine** avec `set(WEEK_OF_YEAR, get(WEEK_OF_YEAR) + n)`. Par exemple, pour le **1er janvier 2021**, la page `+3` aboutit au **24 janvier 2022** au lieu du **18 janvier 2021** (Locale.FRANCE, Europe/Paris). Le même schéma existe dans les helpers d'origine `+1/+2`. Ce comportement n'est pas corrigé par le correctif de registres ; ne pas assimiler les tests des bornes `J..J+30` à une preuve de justesse sur toutes les années calendaires. Le diagnostic reproductible et son échec sont conservés dans `CalendarBoundaryTest.java` et `known-existing-weekyear-risk.log` dans le dossier de preuves. Il appelle à une correction séparée et à une confirmation Android.

Aucun commit, push, tag, release ou publication n'a été effectué.
