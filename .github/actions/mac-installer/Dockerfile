FROM nanobox/mac-env

LABEL "name"="MacOS Installer Generator"
LABEL "maintainer"="Jon Friesen"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="MacOS Installer Generator"
LABEL "com.github.actions.description"="MacOS Installer Generator"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]