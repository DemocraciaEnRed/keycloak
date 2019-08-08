FROM jboss/keycloak:6.0.1
MAINTAINER aaraujo@protonmail.ch

ADD themes/custom /opt/jboss/keycloak/themes

# COPY customization/standalone.xml /opt/jboss/keycloak/standalone/configuration/
# COPY customization/standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/
