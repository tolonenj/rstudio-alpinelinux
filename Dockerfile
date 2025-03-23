FROM alpine:3.21.3

COPY --chmod=500 ./install_alpine.sh /install_alpine.sh
RUN /install_alpine.sh \
    && rm /install_alpine.sh

COPY --chmod=500 ./init /init

EXPOSE 8787

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/init"]
