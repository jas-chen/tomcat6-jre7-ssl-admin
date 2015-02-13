### Tomcat 6 with SSL and Admin user configuration
maintain by Jas Chen

# ports
- 8080 for http
- 8443 for https
- 8000 for debug

# volumes
- /webapp
- /logs

# Tomcat user
- admin:b1uKcRK3r6SZ

# run an app in /c/Users/myapp
docker run -it --rm -p -v /c/Users/myapp:/webapp jas_chen/tomcat

# with logs
docker run -it --rm -p -v /c/Users/myapp:/webapp -v /c/Users/logs:/logs jas_chen/tomcat

# change port
docker run -it --rm -p -v /c/Users/myapp:/webapp jas_chen/tomcat -p 80:8080 -p 443:8443

# add JAVA_OPTS (eg. remote debug)
docker run -it --rm -e JAVA_OPTS='-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n' -p 80:8080 -p 443:8443 -p 8000:8000 -v /c/Users/myapp:/webapp jas_chen/tomcat
