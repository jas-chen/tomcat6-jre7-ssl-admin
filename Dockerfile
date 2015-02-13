FROM tomcat:6-jre7

VOLUME ["/webapp", "/logs"]

RUN rm -rf webapps/ROOT logs webapps/examples webapps/docs
RUN ln -s /webapp webapps/ROOT
RUN ln -s /logs logs

##
# add admin

ADD tomcat-users.xml $CATALINA_HOME/conf/



##
# SSL settings

RUN apt-get update
RUN apt-get install -y libtcnative-1
RUN echo 'export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu' >> setenv.sh

RUN mkdir /root/.ssh
WORKDIR /root/.ssh
RUN \
  openssl genpkey -algorithm rsa -out id_rsa && \
  openssl req -new -batch -key id_rsa -out id_rsa.csr && \
  openssl x509 -req -in id_rsa.csr -signkey id_rsa -out id_rsa.crt && \
  rm id_rsa.csr

WORKDIR $CATALINA_HOME
RUN sed -i '/<!--$/{N;/SSLEnabled/{N;N;N;s/.*<!--\n\(.*\)\/>\n.*-->/\1SSLCertificateFile="\/root\/.ssh\/id_rsa.crt" SSLCertificateKeyFile="\/root\/.ssh\/id_rsa" SSLVerifyClient="optional" \/>/}}' conf/server.xml

EXPOSE 8443



##
# port for remote debug

EXPOSE 8000



##
# run script

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
