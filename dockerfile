FROM quay.io/keycloak/keycloak:26.0.0

# Establecer variables de entorno
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Comando de arranque: modo desarrollo con importación de realms
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start","--optimized", "--http-host=0.0.0.0", "--http-port=$PORT", "--proxy-headers=xforwarded"]