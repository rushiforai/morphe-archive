# Patch Compatibility Report (`v3.16.0`)

- **Target Package**: `com.instagram.android` (and clone package support for `com.instarex.android` / `com.instaprime.android`)
- **Verified Compatible Versions**:
  - `439.0.0.37.89`
  - `444.0.0.47.66`
  - `452.1.0.53.64`
  - `453.0.0.57.79`
  - `454.0.0.54.77`
  - `455.0.0.51.72`
- **Multi-Version Resilience**: All reflection-sensitive entities (`MediaData`, `UserData`, `UserFriendshipStatus`, `StoryLikeHistoryRecorder`) include multi-field and 0-arg getter reflective fallbacks so obfuscated field/method renames across Instagram versions degrade gracefully without crashing or showing raw exception names.
