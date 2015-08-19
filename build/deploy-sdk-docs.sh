# Apply latest docs
rm -fr gh-pages/docs
mv generated-docs gh-pages/docs

# Prep gh-pages branch
cd gh-pages
git config user.name "Build Bot"
git config user.email "build@openstacknetsdk.org"
git add -A docs
git commit -m "Deploy SDK docs @ $bamboo_repository_revision_number"

# Push
git push --quiet "https://$bamboo_deploy_password@github.com/openstacknetsdk/openstacknetsdk.github.io.git" master:master > /dev/null 2>&1
