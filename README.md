# App Name

One-line description of what the app does and who it's for.

## Features
- 

## Requirements
- macOS `<min>` / iOS `<min>` (set per app)
- Latest stable Xcode and Swift

## Getting started
Open `App/<App>.xcodeproj` and run the `<App>` scheme.

## Build from the command line
```sh
Scripts/build.sh        # Release build, installed to ~/Applications (macOS)
Scripts/build.sh ios    # Release build for the iOS Simulator
```
The script reads the app name from `App/*.xcodeproj`, so it needs no edits per app. Output goes to `.build/`, the log to `tmp/build.log`. Unit tests run per package: `swift test -c release -Xswiftc -enable-testing --package-path Packages/<Package>`.

## More
- Project layout and module rules: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- Current status and next steps: [SESSION_STATE.md](SESSION_STATE.md)
- How to work with Claude Code here: [docs/WORKFLOW.md](docs/WORKFLOW.md)
