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
ls

# Go to installer directory
cd /installer

# Copy configs to core installer
echo "--> copy installer configs"
cp $GITHUB_WORKSPACE/.github/installers/windows /installer

# Debugging
ls

echo "--> create installer"
# TODO get current tag & update the end of this
wine ../innosetup/ISCC.exe core.iss /DMyAppVersion=v0.0.0

echo "--> copy generated installer back to dist"
cp /installer/Output/GoPipelineSetup.exe $GITHUB_WORKSPACE/dist/