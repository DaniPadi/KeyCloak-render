FROM quay.io/keycloak/keycloak:26.4.0

# Admin
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin


ENV KC_DB=postgres
ENV KC_DB_PASSWORD=9ZOel54euK*
ENV KC_DB_URL_HOST=database-1.cidsieogcqxr.us-east-1.rds.amazonaws.com
ENV KC_DB_URL_PORT=5432
ENV KC_DB_USERNAME=postgres
ENV KC_DB_URL_DATABASE=postgres

# Limitar memoria
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Script de arranque directo, expandiendo $PORT en runtime
ENTRYPOINT ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-host=0.0.0.0 --http-port=${PORT} --proxy-headers=xforwarded"]
