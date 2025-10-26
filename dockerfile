FROM quay.io/keycloak/keycloak:26.0.0

# Admin
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Limitar memoria
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Crear script en directorio escribible
RUN mkdir -p /opt/keycloak/data/scripts
RUN echo '#!/bin/sh\nexec /opt/keycloak/bin/kc.sh start --optimized --http-host=0.0.0.0 --http-port=${PORT} --proxy-headers=xforwarded' > /opt/keycloak/data/scripts/start.sh
RUN chmod +x /opt/keycloak/data/scripts/start.sh

# ENTRYPOINT usando shell para expandir $PORT
ENTRYPOINT ["/bin/sh", "-c", "/opt/keycloak/data/scripts/start.sh"]
