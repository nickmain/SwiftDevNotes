##!/bin/sh

xcrun xcodebuild docbuild \
    -scheme SwiftDevNotes \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/SwiftDevNotes.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "SwiftDevNotes"

echo '<script>window.location.href += "documentation/swiftdevnotes"</script>' > .docs/index.html
