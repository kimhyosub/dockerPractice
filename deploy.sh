#!/bin/bash

echo "wellcome My Shell"a

TOMCAT_HOME=/usr/apps/tomcat
MY_SLIPP_HOME=/usr/apps/my-slipp

cd $MY_SLIPP_HOME
git pull

./mvnw clean package

cd $TOMCAT_HOME/bin
./shutdown.sh

cd $TOMCAT_HOME/webapps
rm -rf ROOT

mv $MY_SLIPP_HOME/target/my-slipp-1.0 $TOMCAT_HOME/webapps/ROOT

cd $TOMCAT_HOME/bin

./startup.sh

tail -f $TOMCAT_HOME/logs/catalina.out
~                                         