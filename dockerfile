FROM quay.io/keycloak/keycloak:26.4.0

# Admin
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin
ENV KC_DB=postgres
ENV KC_DB_URL_HOST=database-1.cidsieogcqxr.us-east-1.rds.amazonaws.com

# Limitar memoria
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Script de arranque directo, expandiendo $PORT en runtime
ENTRYPOINT ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-host=0.0.0.0 --http-port=${PORT} --proxy-headers=xforwarded"]
