#!/bin/sh

if [ -n "${JAVA_OPTS}" ];
then
  echo "JAVA_OPTS=\"\${JAVA_OPTS}\"" >> bin/setenv.sh
fi

echo "=================================================="
echo "You can now configure to this Tomcat server using:"
echo ""
echo " http://127.0.0.1:8080/manager/html"
echo " http://127.0.0.1:8080/host-manager/html"
echo ""
echo " admin:b1uKcRK3r6SZ"
echo ""
echo "=================================================="

exec ${CATALINA_HOME}/bin/catalina.sh run
