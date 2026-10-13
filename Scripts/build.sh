#!/bin/sh
# Builds the app in Release; on macOS also installs it to ~/Applications.
# Works for any app: the name comes from the single App/*.xcodeproj.
# Usage: Scripts/build.sh [macos|ios]   (default: macos)
# Optional env: SCHEME (default: the project name)
set -eu

ROOT_DIR=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT_DIR"

PLATFORM=${1:-macos}

set -- App/*.xcodeproj
if [ $# -ne 1 ] || [ ! -d "$1" ]; then
    echo "error: expected exactly one App/<App>.xcodeproj" >&2
    exit 1
fi
PROJECT=$1
APP_NAME=$(basename "$PROJECT" .xcodeproj)
SCHEME=${SCHEME:-$APP_NAME}

case "$PLATFORM" in
    macos) DESTINATION='generic/platform=macOS' ;;
    ios)   DESTINATION='generic/platform=iOS Simulator' ;;
    *) echo "error: platform must be macos or ios" >&2; exit 1 ;;
esac

mkdir -p tmp
if ! xcodebuild \
    -project "$PROJECT" \
    -scheme "$SCHEME" \
    -configuration Release \
    -destination "$DESTINATION" \
    -derivedDataPath "$ROOT_DIR/.build/DerivedData" \
    SYMROOT="$ROOT_DIR/.build/output" \
    -quiet > tmp/build.log 2>&1; then
    grep -E "error:" tmp/build.log | sort -u | head -40
    echo "Build failed, see tmp/build.log" >&2
    exit 1
fi
grep -E "warning:" tmp/build.log | sort -u | head -40 || true

if [ "$PLATFORM" = macos ]; then
    BUILT_APP="$ROOT_DIR/.build/output/Release/$APP_NAME.app"
    INSTALLED_APP="$HOME/Applications/$APP_NAME.app"
    mkdir -p "$HOME/Applications"
    rm -rf "$INSTALLED_APP"
    cp -R "$BUILT_APP" "$INSTALLED_APP"
    echo "Installed $INSTALLED_APP"
else
    echo "Built $APP_NAME ($PLATFORM), nothing to install"
fi
