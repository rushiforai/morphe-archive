# Plan — remaining work

Only outstanding actions. Procedure details live in the linked docs.

## Finish release QA

Run the [QA checklist](qa-checklist.md) end to end:

- [ ] Recover the installed APK's input/bundle hashes and enabled options, or
      re-patch and sign with an explicitly selected bundle and default-on
      options. Verify login on that exact build.
- [ ] Establish actual sponsored-unit removal with controlled comparison or
      runtime filtering evidence, plus visual confirmation of gap-free content;
      label absence and clean scrolling alone are insufficient.
- [ ] Test the opt-in renamed package alongside **stock-signed** Threads,
      including launch/login checks. Obtain the stock APK and approval before
      replacing a differently signed install.

## Release

- [ ] After required QA passes, merge (no squash) into `main`, stage with
      `scripts/prepare-release.sh`, and push the version tag for the stable
      release ([release process](release.md)).
