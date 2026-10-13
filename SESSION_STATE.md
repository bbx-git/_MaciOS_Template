# Session State

_Overwritten at every wrap-up, never appended. Under 30 lines; git has the history. Don't record build or test status._

- **Active plan:** none (path in `docs/plans/` when there is one; its checkboxes show what's done)

## Next
1. Ask the user for the app name, platforms and minimum OS versions; fill in `README.md`.
2. User creates the Xcode project in Xcode (File › New › Project) and saves it as `App/<App>.xcodeproj`.
3. Create `Packages/Core`, `Packages/Domain` and `Packages/Features` per `docs/ARCHITECTURE.md`; add them to the app target.
4. Add `App/<App>.xcodeproj/xcshareddata/IDETemplateMacros.plist` with an empty `FILEHEADER`, so new files get no name or copyright header.
5. Test, build, deploy, then overwrite this file.

## Open problems
- _none_
