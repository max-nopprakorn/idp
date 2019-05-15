FROM jboss/keycloak:4.5.0.Final


USER root
RUN yum install -y wget && yum install -y nmap && yum install -y epel-release && yum install -y jq  &&  yum install -y unzip && yum clean all

ENV KEYCLOAK_HOME /opt/jboss/keycloak


COPY themes /opt/jboss/keycloak/themes

#COPY providers /opt/jboss/keycloak/standalone/deployments/
COPY config/standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/
COPY realms/scblife.json /tmp/realm.json


USER root
RUN chown -R jboss:root /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
RUN chmod 664 /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml

COPY scblife-entrypoint.sh /scblife-entrypoint.sh
RUN chmod 777 /scblife-entrypoint.sh



RUN adduser keycloak --gid 0 --home /usr/local/keycloak \
	&& chgrp -R 0 /opt/jboss \
	&& chmod -R g+rw /opt/jboss \
	&& find /opt/jboss -type d -exec chmod g+x {} + \
	&& chown keycloak /opt/jboss/tools/docker-entrypoint.sh

EXPOSE 8443

USER keycloak

ENV KEYCLOAK_ENV=production

ENTRYPOINT ["/scblife-entrypoint.sh"]
