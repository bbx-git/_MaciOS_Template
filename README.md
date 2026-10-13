# App Name

One-line description of what the app does and who it's for.

## Features
- 

## Requirements
- macOS `<min>` (set per app)
- Latest stable Swift toolchain (Xcode or Command Line Tools)

## Build and run
```sh
Scripts/build.sh
```
Builds the Release binary with SwiftPM, wraps it in a `.app`, signs it ad hoc and installs it to `~/Applications/`. The app name comes from `App/Resources/Info.plist`, so the script needs no edits per app. The log is in `tmp/build.log`. Unit tests: `swift test -c release -Xswiftc -enable-testing --package-path <.|Packages/Package>`.

## More
- Project layout and module rules: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- Current status and next steps: [SESSION_STATE.md](SESSION_STATE.md)
- How to work with Claude Code here: [docs/WORKFLOW.md](docs/WORKFLOW.md)
