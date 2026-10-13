# Session State

_Overwritten at every wrap-up, never appended. Under 30 lines; git has the history. Don't record build or test status._

- **Active plan:** none (path in `docs/plans/` when there is one; its checkboxes show what's done)

## Next
1. Ask the user for the app name and minimum macOS version; fill in `README.md`.
2. Create the root `Package.swift` (executable target `<App>` at `App/<App>`), `App/<App>/` with the `@main` entry and `App/Resources/Info.plist` (`CFBundleExecutable` = `<App>`).
3. Create `Packages/Core`, `Packages/Domain` and `Packages/Features` per `docs/ARCHITECTURE.md`; add them as path dependencies.
4. Test, run `Scripts/build.sh`, then overwrite this file.

## Open problems
- _none_
