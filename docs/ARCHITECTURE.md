# Architecture

## Layout
```text
.
├── App/
│   ├── <App>.xcodeproj
│   └── <App>/              @main, dependency wiring, assets, entitlements
│       └── Incubator/      experimental code (see below)
├── Extensions/             one folder per extension target (widget, share, …)
├── Packages/
│   ├── Core/               low-level building blocks: utilities, storage, networking
│   ├── Domain/             models and business logic
│   └── Features/           SwiftUI feature modules + DesignSystem
├── Fixtures/               sample media for tests (local/ is gitignored)
├── docs/
│   ├── ARCHITECTURE.md
│   ├── decisions/          NNNN-short-title.md
│   └── plans/              active plans only
├── tmp/                    scratch and logs (gitignored)
├── CLAUDE.md
├── README.md
└── SESSION_STATE.md
```

## Dependency rules
- Imports only point down: App/Extensions → Features → Domain → Core. Skipping a layer downward is fine; importing upward never is.
- Feature targets never import each other. Shared views go in the `DesignSystem` target; shared logic moves down to Domain.
- Domain and Core don't import SwiftUI, AppKit or UIKit.
- No source file belongs to more than one target. Code needed by two targets lives in a package.

## Thin targets
App and extension targets only start the app, wire dependencies and hold assets and entitlements. Everything else comes from packages.

## Incubator
New experimental features or tiny helpers may start in `App/<App>/Incubator/`. Move them into a package as soon as they stabilize or another target needs them.

## Packages
- Each package has `Package.swift`, `Sources/<Target>/` and `Tests/<Target>Tests/`. Every target gets a test target.
- `swift-tools-version`: latest. Platforms: the minimums in `README.md`.
- Feature targets use `swiftSettings: [.defaultIsolation(MainActor.self)]`. Core and Domain stay nonisolated, with explicit `Sendable` types.
- Tests load media from `Fixtures/` at the repo root (resolved from `#filePath`).
