#!/bin/bash

set -e
# set -x
# set -exo pipefail

if [[ -z "$GITHUB_WORKSPACE" ]]; then
  echo "Set the GITHUB_WORKSPACE env variable."
  exit 1
fi

echo "--> copy executable to bundle folder"
mkdir /mpkg
mkdir /mpkg/installer.pkg
cp $GITHUB_WORKSPACE/.github/installers/macos/mpkg/Distribution /mpkg/Distribution
cp -r $GITHUB_WORKSPACE/.github/installers/macos/mpkg/installer.pkg /mpkg/

echo "--> setup package structure"
cd /mpkg/installer.pkg
mkdir rootfs
cd rootfs
mkdir -p usr/local/bin

echo "--> copy binary"
cp $GITHUB_WORKSPACE/dist/gopipeline_darwin_amd64/gopipeline usr/local/bin/
ls -al /usr/local/bin/
find . | cpio -o --format odc | gzip -c > ../Payload
mkbom . ../Bom

echo "--> update meta references"
ls -la
echo $PWD
sed -i \
		-e "s/%MAKO_NUMBER_OF_FILES%/`find . | wc -l`/g" \
		-e "s/%MAKO_INSTALL_KBYTES%/`du -sk | cut -f1`/g" \
		-e "s/%MAKO_VERSION%/$MAKO_VERSION/g" \
		-e "s/%INSTALLER_VERSION%/$INSTALLER_VERSION/g" \
		../PackageInfo /mpkg/Distribution

cd ..
rm -rf ./rootfs

cp -r $GITHUB_WORKSPACE/.github/installers/macos/mpkg/Resources /mpkg/

sed -i \
    -e "s/%INSTALLER_VERSION%/$INSTALLER_VERSION/g" \
    /mpkg/Resources/en.lproj/welcome.rtfd/TXT.rtf

echo "--> create installer"
cd /mpkg
xar -c --compression=none -f /installer.pkg .

echo "--> copy generated installer back to dist"
mv /installer.pkg $GITHUB_WORKSPACE/dist/GoPipeline.pkg