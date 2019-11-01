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
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]