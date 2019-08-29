FROM python:3.7-alpine

LABEL "com.github.actions.name"="Backblaze B2 Sync"
LABEL "com.github.actions.description"="Sync a directory to a Backblaze B2 cloud storage bucket"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="red"

LABEL version="0.1.0"
LABEL repository="https://github.com/jakejarvis/backblaze-b2-action"
LABEL homepage="https://jarv.is/"
LABEL maintainer="Jake Jarvis <jake@jarv.is>"

# https://github.com/Backblaze/B2_Command_Line_Tool/releases
ENV B2CLI_VERSION="1.4.0"

RUN pip install --quiet --no-cache-dir b2==${B2CLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
