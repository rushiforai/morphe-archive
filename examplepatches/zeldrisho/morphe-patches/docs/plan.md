# Plan — remaining work

## Finish release QA
- [ ] Recover the installed APK's input/bundle hashes and enabled options, or
      re-patch and sign with an explicitly selected bundle and default-on
      options. Verify login on that exact build (`docs/qa-checklist.md` §2).
- [ ] Establish actual sponsored-unit removal with controlled comparison or
      runtime filtering evidence, plus visual confirmation of gap-free content;
      label absence and clean scrolling alone are insufficient.
- [ ] Test the opt-in renamed package alongside **stock-signed** Threads,
      including launch/login checks (`docs/qa-checklist.md` §§2–3). Obtain the
      stock APK and approval before replacing a differently signed install.

## Release
- [ ] After required QA passes, merge (no squash) `dev` → `main` for the
      automated stable release (`docs/release.md`).
