Tomcat 6 with SSL and Admin user configuration
==============================================

# ports
- 8080 for http
- 8443 for https
- 8000 for debug


# volumes
- /webapp
- /logs


# Tomcat user
- admin:b1uKcRK3r6SZ


# Usage

### Run an app in /Users/jas/myapp
    docker run -it --rm -p 8080 -p 8443 -v /Users/jas/myapp:/webapp jaschen/tomcat6-jre7-ssl-admin

### With logs
    docker run -it --rm -p 8080 -p 8443 -v /Users/jas/myapp:/webapp -v /Users/jas/logs:/logs jaschen/tomcat6-jre7-ssl-admin

### Add JAVA_OPTS (eg. remote debug)
    docker run -it --rm -e JAVA_OPTS='-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n' -p 80:8080 -p 443:8443 -p 8000:8000 -v /Users/jas/myapp:/webapp jaschen/tomcat6-jre7-ssl-admin


# Based on Dockerfiles
- vubui/tomcat-ssl
- maluuba/tomcat7
- tutum/tomcat
