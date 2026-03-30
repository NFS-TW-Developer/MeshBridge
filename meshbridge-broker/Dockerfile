FROM eclipse-mosquitto:2
ENV MESHBRIDGE_CONNECTION_NAME=official_bridge

COPY mosquitto.conf /templates/mosquitto.conf
COPY passwd /templates/passwd
COPY acl /templates/acl
COPY entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh
ENTRYPOINT ["/custom-entrypoint.sh"]