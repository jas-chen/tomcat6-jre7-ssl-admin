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

### Run an app in /c/Users/myapp
    docker run -it --rm -p -v /c/Users/myapp:/webapp jaschen/tomcat6-jre7-ssl-admin

### With logs
    docker run -it --rm -p -v /c/Users/myapp:/webapp -v /c/Users/logs:/logs jaschen/tomcat6-jre7-ssl-admin

### Change port
    docker run -it --rm -p -v /c/Users/myapp:/webapp jaschen/tomcat6-jre7-ssl-admin -p 80:8080 -p 443:8443

### Add JAVA_OPTS (eg. remote debug)
    docker run -it --rm -e JAVA_OPTS='-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n' -p 80:8080 -p 443:8443 -p 8000:8000 -v /c/Users/myapp:/webapp jaschen/tomcat6-jre7-ssl-admin


# Based on Dockerfiles
- vubui/tomcat-ssl
- maluuba/tomcat7
- tutum/tomcat
