Tomcat 6 with SSL and Admin user configuration
==============================================

# ports
- `8080` for http
- `8443` for https
- `8000` for debug


# volumes
- `/webapp`
- `/logs`


# Tomcat admin
- `admin`:`b1uKcRK3r6SZ`


# Usage

### Run an app in `/Users/jas/myapp`
    docker run -it --rm -p 80:8080 -p 443:8443 -v /Users/jas/myapp:/webapp jaschen/tomcat6-jre7-ssl-admin

You can browse the app at [http://localhost/](http://localhost/)

or [https://localhost/](https://localhost/) for https.

 (if you are using boot2docker, the ip will be `192.168.59.103`)

> You can use `admin`:`b1uKcRK3r6SZ` to manage Tomcat at

>  [http://localhost/manager/html](http://localhost/manager/html)
>  and [http://localhost/host-manager/html](http://localhost/host-manager/html)

### With logs
    docker run -it --rm -p 80:8080 -p 443:8443 -v /Users/jas/myapp:/webapp -v /Users/jas/logs:/logs jaschen/tomcat6-jre7-ssl-admin

Goto `/Users/jas/logs` and you will find logs.

### Add JAVA_OPTS (eg. remote debug)
    docker run -it --rm -e JAVA_OPTS='-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n' -p 80:8080 -p 443:8443 -p 8000:8000 -v /Users/jas/myapp:/webapp jaschen/tomcat6-jre7-ssl-admin


# Based on Dockerfiles
- [vubui/tomcat-ssl](https://registry.hub.docker.com/u/vubui/tomcat-ssl/)
- [maluuba/tomcat7](https://registry.hub.docker.com/u/maluuba/tomcat7/)
- [tutum/tomcat](https://registry.hub.docker.com/u/tutum/tomcat/)
