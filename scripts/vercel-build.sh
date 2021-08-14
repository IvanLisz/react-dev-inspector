#!/usr/bin/env bash
# working directory is project root dir

# bash strict mode (https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425)
# https://www.explainshell.com/explain/1posix/set
set -euxo pipefail

# https://github.com/chalk/supports-color/blob/main/index.js#L21
export FORCE_COLOR=true

env

npm run build

# due to vercel bug of symlink file
rm -rf sites/cra/src/layouts
cp -rf sites/umi3/src/layouts sites/cra/src/

rm -rf sites/vite2/src/layouts
cp -rf sites/umi3/src/layouts sites/vite2/src/


npm run build:site
