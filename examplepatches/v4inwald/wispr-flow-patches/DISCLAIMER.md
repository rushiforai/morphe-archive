# Disclaimer

## Scope

This repository documents how the Wispr Flow Android application behaves, and provides
patches that change a small number of behaviours on a device **you own**, for an
application **you have obtained yourself**.

The intended use is interoperability and personal preference: dictating without hitting a
weekly quota, on a build that starts at all.

## What this project does

* It changes **client-side logic**: a quota gate evaluated locally, and the installer name
  the app reads to decide whether Play's local licence fallback applies.
* It reports the results of what it changed, offline, on the artefact it produced.

## What this project does not do

* It does not distribute the application, in whole or in part. No APK, DEX, resource table or
  decompiled source is stored here, and `.gitignore` enforces that.
* It does not forge a Play purchase, a Play Integrity verdict, or a server-side entitlement.
  RevenueCat stays authoritative for what the account owns; the patches only change what the
  client concludes about its own installation.
* It does not touch authentication, credentials, or other users' data.

## Redistribution and identity

Re-signing changes the application's signing certificate. That is a property of the build, not
a defect to hide: the patched build is not the Play-signed binary, and the app is told only
what it asks about its installer. Two consequences worth knowing:

* the patched build cannot update over a Play-installed one — uninstall first;
* a future version may stop trusting the installer check, at which point the
  `play-store-source` patch stops being sufficient.

## Legal

Reverse engineering for interoperability is expressly permitted in some jurisdictions and
restricted in others, and it may interact with an application's terms of service. You are
responsible for knowing which situation applies to you. The authors provide this material for
research and personal use, without warranty of any kind.
