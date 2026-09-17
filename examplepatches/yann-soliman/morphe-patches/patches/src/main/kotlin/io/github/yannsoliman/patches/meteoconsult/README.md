# METEO CONSULT 1.1.4 (37)

Package : `com.meteoconsult.androidapp`. Entrée testée : XAPK APKPure avec APK de base
et splits arm64, anglais et xxhdpi. Utiliser le XAPK complet dans Morphe.

## Comportement

Le patch **Meteo Consult: remove ads and subscription prompts** regroupe les trois
correctifs précédents dans un seul patch sélectionnable. Il désactive l'appel qui
ouvre l'abonnement en réponse à `BulletinEndReached`, neutralise les emplacements
publicitaires et bloque les promotions automatiques du paywall.

Une option indépendante complète ce nettoyage :

- **Meteo Consult: disable video autoplay** prépare normalement le média mais
  laisse le lecteur météo en pause lors de son ouverture. Le bouton de lecture
  continue de fonctionner. Les vidéos publicitaires relèvent du patch de nettoyage.

Il ne change ni la limite de l'API, ni les heures reçues, ni le statut du compte.
Après la dernière heure disponible, les données peuvent donc rester vides.
Le comparateur et les autres accès à l'abonnement conservent leur comportement.

La version initiale du patch a été signalée comme redirigeant vers Google Play au
démarrage. L'APK enregistre `LicenseContentProvider`, qui déclenche le contrôle
d'installation Play avant l'interface. Un refus provoque l'envoi du PendingIntent
fourni par Play puis la fermeture de l'application. Ce chemin correspond au symptôme,
mais aucun log du téléphone n'a été fourni pour le confirmer.

Le patch désactive aussi cet appel de démarrage pour permettre l'utilisation de
l'application signée et installée localement par Morphe. Le provider est conservé
et son `onCreate` retourne toujours vrai. Les contrôles d'abonnement météo côté
serveur et le SDK de facturation ne sont pas modifiés.

Pour les publicités, l'inventaire renvoyé aux vues publicitaires est remplacé par
une absence d'annonce. Les bannières, vidéos et interstitiels passent ainsi par
les chemins vides déjà prévus par l'application. L'initialisation du gestionnaire
publicitaire reste en place ; ce patch ne modifie pas les appels météo.

Pour les promotions, le drapeau de configuration de la popup est forcé à `false`
et la décision finale qui programme l'interstitiel de promotion est bloquée. Les
écrans de compte et d'abonnement ouverts volontairement restent accessibles.

## Analyse de l'APK

SHA-256 de l'APK de base :
`49d7dd9824b572acfb52ba423d1be7576dcd4f6e231fde1f7d17a70e87492fa6`.

- `yn/e` émet `BulletinEndReached` lorsque le jour sélectionné dépasse le dernier
  jour des prévisions horaires disponibles. `yn/b` émet aussi cet événement en fin de liste.
- `xl/q` fournit le gestionnaire `c0/i2`, cas 9, qui vérifie l'événement et la restriction.
- Le callback reçu de `jn/b` est `eq/j`, cas 1 : il choisit `forecastBulletin` et met
  l'état d'affichage de l'abonnement à vrai.
- `ll/a` utilise cet état pour remplacer le bulletin par l'écran d'abonnement.

Pour les publicités, `AdvertisingManager.getAdForSpace` renvoie toujours `null` et
`getCountProviderForSpace` renvoie `0`. Les vues existantes détectent alors
l'absence d'inventaire et n'affichent pas leur contenu publicitaire.

Pour les promotions, `ConfigurationContent.isPopupPaywallActive` renvoie toujours
`false`. Une seconde garde remplace la branche qui choisit
`INTERSTITIAL_PROMO_PAYWALL` par un retour nul dans `km/q.b`, afin qu'une réponse
de configuration incompatible ne puisse pas réactiver la sollicitation. La popup
d'essai lancée à l'ouverture emprunte un autre chemin : le démarrage du
`CurrentOfferCoordinator` dans `MeteoTerrestreApplication.onCreate`. Ce lancement
est également neutralisé, sans modifier les écrans d'abonnement ouverts manuellement.

Le lecteur vidéo Media3 est initialisé dans `mq/f.invokeSuspend`. L'application
prépare la source puis appelle `playWhenReady(true)`. Le patch d'autoplay conserve
la préparation et remplace uniquement ce booléen par `false`.

Le changement du bulletin est le remplacement par `nop` de l'appel `Function0.invoke`
à l'offset 0x2c6 de `Lc0/i2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;`
dans `classes.dex`. Son résultat est ignoré et l'instruction suivante est un `goto`.
L'appel du comparateur à 0x2f6 n'est pas modifié.

Le correctif de démarrage remplace l'appel `LicenseClient.initializeLicenseCheck()V`
à l'offset 0x12 du `LicenseContentProvider.onCreate()Z` par `nop`. Le nom du provider,
les deux appels, les sept instructions et le retour vrai sont vérifiés avant édition.
Les cibles du bulletin et du démarrage doivent toutes correspondre avant modification.

Ces noms et offsets documentent l'analyse ; le patch sélectionne les classes
par les chaînes `BulletinEndReached` et `ComparatorEndReached`, puis identifie
l'appel par ses références et la structure de la branche. Chaque cible doit
être unique et la séquence d'instructions doit correspondre avant modification.

## Validation

La compilation CI ne remplace pas un essai sur téléphone. Pour le test fonctionnel :

1. Dans l'application d'origine, ouvrir un lieu et dépasser la dernière heure disponible
   dans les prévisions horaires ; constater l'ouverture de l'abonnement.
2. Repartir du XAPK original 1.1.4, appliquer ce patch avec Morphe, vérifier que
   l'application démarre sans renvoi vers Play Store puis refaire le même parcours.
3. Vérifier que le bulletin reste affiché, même si aucune donnée supplémentaire n'apparaît.
4. Revenir aux premières heures, changer de lieu puis relancer l'application.
5. Vérifier qu'aucune bannière, vidéo ou interstitiel publicitaire ne s'affiche dans
   les écrans habituels.
6. Attendre les écrans d'accueil et de prévisions ; aucune sollicitation automatique
   du paywall ne doit apparaître.
7. Vérifier que l'accès volontaire à l'abonnement depuis le compte fonctionne toujours.

Pour valider l'autoplay, ouvrir une vidéo météo depuis l'application : la première
image doit rester en pause, puis la lecture doit démarrer après une action manuelle.

Le mode confidentialité expérimental a été retiré après confirmation d'un crash au
démarrage sur appareil. Le patch autoplay reste indépendant et peut être combiné
avec le nettoyage. La limite de 24 heures côté serveur reste inchangée.

Publier sur `dev` et tester la pré-release avant promotion vers `main`.
