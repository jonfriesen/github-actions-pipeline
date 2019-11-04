#!/bin/bash

set -e
# set -x
# set -exo pipefail

if [[ -z "$GITHUB_WORKSPACE" ]]; then
  echo "Set the GITHUB_WORKSPACE env variable."
  exit 1
fi

# if [[ -z "$GITHUB_REPOSITORY" ]]; then
#   echo "Set the GITHUB_REPOSITORY env variable."
#   exit 1
# fi

# Copy our generated binary out to a temp directory
echo "--> copy executable to bundle folder"
mkdir /bundle
cp $GITHUB_WORKSPACE/dist/gopipeline_windows_amd64/gopipeline.exe /bundle/gopipeline.exe

# Debugging
ls /bundle

# Go to installer directory
mkdir /installer
cd /installer

# Copy configs to core installer
echo "--> copy installer configs"
cp -r $GITHUB_WORKSPACE/.github/installers/windows/* /installer/

# Debugging
ls

echo "--> create installer"
# Hack because default home is not owned by us
mkdir /tmphome
export HOME=/tmphome
# TODO get current tag & update the end of this
wine ../innosetup/ISCC.exe core.iss /DMyAppVersion=$TAG_NAME

echo "--> copy generated installer back to dist"
cp /installer/Output/GoPipelineSetup.exe $GITHUB_WORKSPACE/dist/