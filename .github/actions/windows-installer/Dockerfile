FROM nanobox/windows-env

LABEL "name"="Windows Installer Generator"
LABEL "maintainer"="Jon Friesen"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="Windows Installer Generator"
LABEL "com.github.actions.description"="Windows Installer Generator"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

RUN rm -rf /tmp/.wine-0/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


# ARG INSTALLER_VERSION

# RUN mkdir /bundle

# WORKDIR /bundle

# # fetch mako
# # RUN curl -fsSL -o mako.exe "https://mako.nyc3.digitaloceanspaces.com/cli/windows/mako.exe"

# WORKDIR /installer
# 

# # Add installer resources
# COPY windows /installer

# # Create installer
# RUN wine ../innosetup/ISCC.exe mako.iss /DMyAppVersion=$INSTALLER_VERSION