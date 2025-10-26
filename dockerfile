FROM quay.io/keycloak/keycloak:26.0.0

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin
ENV JAVA_OPTS="-Xms256m -Xmx512m"
ENV PORT=8080

# Cambiar a root temporalmente para crear el script
USER root
RUN echo '#!/bin/sh\nexec /opt/keycloak/bin/kc.sh start --optimized --http-host=0.0.0.0 --http-port=${PORT} --proxy-headers=xforwarded' > /start.sh
RUN chmod +x /start.sh
USER 1000  # Volver al usuario default de Keycloak

ENTRYPOINT ["/start.sh"]
