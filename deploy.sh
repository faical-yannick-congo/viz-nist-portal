#!/usr/bin/env sh
# abort on errors
set -e

# build
git clone --branch gh-pages "https://${BOT_USER}:${BOT_TOKEN}@github.com/usnistgov/viz-nist-portal.git" /tmp/dist

echo "Checking out gh-pages."
cd /tmp/dist
git fetch origin gh-pages
git checkout gh-pages
cd /viz-nist-portal


npm install -g @vue/cli
yarn run build
# navigate into the build output directory
cp -r dist/* /tmp/dist/
# if you are deploying to a custom domain
# echo 'viz.nist.gov' > CNAME

cd /tmp/dist
git add --all
git commit -m "deployed at ${DATA_TIMESTAMP}"
git push origin gh-pages
cd -
