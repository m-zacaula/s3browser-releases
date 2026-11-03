#!/bin/bash
# Installs (or updates) S3 Browser in /Applications and opens it. Run in Terminal:
#   curl -fsSL https://raw.githubusercontent.com/m-zacaula/s3browser-releases/main/install.sh | bash
# Downloading with curl instead of a browser means macOS doesn't block the app on first open,
# and there's no disk image to mount or eject.
set -e
URL="https://github.com/m-zacaula/s3browser-releases/releases/latest/download/S3Browser.zip"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Downloading the latest S3 Browser..."
curl -fsSL "$URL" -o "$TMP/S3Browser.zip"
ditto -x -k "$TMP/S3Browser.zip" "$TMP"
[ -d "$TMP/S3 Browser.app" ] || { echo "The download didn't contain S3 Browser.app. Try again in a minute."; exit 1; }

# Replace a copy that's already installed (quit it first if it's running)
osascript -e 'tell application "S3 Browser" to quit' >/dev/null 2>&1 || true
sleep 1
rm -rf "/Applications/S3 Browser.app"
ditto "$TMP/S3 Browser.app" "/Applications/S3 Browser.app"
echo "Installed S3 Browser $(/usr/libexec/PlistBuddy -c 'Print CFBundleShortVersionString' "/Applications/S3 Browser.app/Contents/Info.plist") in Applications."

if [ ! -x /opt/homebrew/bin/node ] && [ ! -x /usr/local/bin/node ] && [ ! -x "$HOME/.volta/bin/node" ]; then
  echo
  echo "S3 Browser also needs Node.js. Install it with:"
  echo "  brew install node"
fi
if [ ! -f "$HOME/.aws/config" ] && [ ! -f "$HOME/.aws/credentials" ]; then
  echo
  echo "S3 Browser uses your AWS CLI profiles. Add one with:"
  echo "  aws configure          (access keys)"
  echo "  aws configure sso      (single sign-on)"
fi
open "/Applications/S3 Browser.app"
