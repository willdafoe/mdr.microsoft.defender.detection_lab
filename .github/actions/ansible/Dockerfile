FROM alpine/ansible

LABEL org.opencontainers.image.authors="ralph.brynard@thebrynards.com"

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["bash","/entrypoint.sh"]