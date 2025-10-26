# Imagen oficial de Keycloak 26
FROM quay.io/keycloak/keycloak:26.0.0

# Admin user
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Limitar memoria JVM para Render free-tier
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Puerto dinámico (Render lo reemplaza en runtime)
ENV PORT=8080

# Script de arranque que evalúa $PORT correctamente
RUN echo '#!/bin/sh\n\
exec /opt/keycloak/bin/kc.sh start --optimized --http-host=0.0.0.0 --http-port=${PORT} --proxy-headers=xforwarded' \
> /start.sh && chmod +x /start.sh

# Comando de inicio
ENTRYPOINT ["/start.sh"]
