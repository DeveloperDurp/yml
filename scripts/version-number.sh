
if [ -z "$VERSION" ]; then
  VERSION="1"
fi
export COMMIT_COUNT=$(git rev-list --count HEAD)
export BUILD_NUMBER=$CI_PIPELINE_ID
export VERSION="$VERSION.$COMMIT_COUNT.$BUILD_NUMBER"
echo $VERSION > version.env
cat version.env
