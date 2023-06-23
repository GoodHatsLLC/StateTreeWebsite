#!/usr/bin/env bash

ABSROOT="$(git rev-parse --show-toplevel)"
SUBMODULE="src/docs/checkout/statetree"
BUILDOUT="src/docs/build"
ABSOUT="${ABSROOT}/${BUILDOUT}"
BRANCH="${1:-main}"
pushd >/dev/null "${ABSROOT}/${SUBMODULE}" || exit 1
echo "🛠️ Resolving package…"
./scripts/runswift --docc package resolve
echo "🛠️ Resolved."
echo "🏗️ Building DocC plugin"
./scripts/runswift --docc build
echo "🏗️ Built."
echo "📚 Generating docs…"
./scripts/runswift --docc package --allow-writing-to-directory
    generate-documentation \
    --disable-indexing \
    --transform-for-static-hosting \
    --output-path "${ABSOUT}"
echo "📚 Generated."
echo "🧹 Cleaning up…"
>/dev/null git reset --hard || exit 1
echo "🧹 Done."
echo "✅ Generated to:"
echo "${ABSOUT}"



# TODO: work out what's not being emitted.
# these lines were helpful.
# swift build --target StateTree --configuration debug -Xswiftc -emit-symbol-graph -Xswiftc -emit-symbol-graph-dir -Xswiftc .build
# swift package generate-documentation --additional-symbol-graph-dir .build
