#!/usr/bin/env bash


JENKINS_ROOT=/usr/local/server/jenkins
JENKINS_FILENAME=jenkins.war

PORT=8800

case "$1" in
start)
  cd ${JENKINS_ROOT}
  nohup java -jar ${JENKINS_ROOT}/${JENKINS_FILENAME} --ajp13Port=-1 --httpPort=${PORT} &
  ;;
stop)
  PID=`jps |grep war|awk '{print $1}'`
  kill -9 ${PID}
  ;;
restart)
  stop
  start
  ;;
status)
  ps -ef|grep ${JENKINS_FILENAME}
  ;;
*)
  printf 'Usage: %s {start|stop|restart|status}\n'
  exit 1
  ;;
esac