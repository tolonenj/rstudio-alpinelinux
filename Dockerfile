FROM alpine:3.21.2
ENV TZ="Europe/Helsinki"

COPY --chmod=700 ./entrypoint.sh /init

COPY ./var/www /var/www

COPY ./usr/share/zoneinfo /usr/share/zoneinfo

COPY --chmod=700 ./install_alpine.sh /tmp/install_alpine.sh

RUN /tmp/install_alpine.sh

EXPOSE 8787

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/init"]
