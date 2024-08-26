#!/bin/bash

###DECLARED VARIABLE

instance=minikube
action=${1}

#process= ps -ef | grep -i minikube | awk '{ print $2 }' 
#process= docker container ls  | grep -i $instance | awk '{ print $15}'

process="docker container ls  | grep -i minikube" 
dead="docker container ls  | grep -i minikube | awk '{print $15}'"
ps="ps -ef | grep -i 045bda26d426 | grep -v grep | grep -w Exited "
#PID= kill -9 $(ps -ef | grep -i minikube | awk '{ print $2 }')

# start | stop | status  script
#===============================
start()
{
docker container start 045bda26d426
#ps -ef | grep -i minikube
}

stop()
{
docker container stop 045bda26d426
#ps -ef | grep -i minikube
}
#restart()
#{
#restart)
#   $0 stop
#   $0 start
#   ;;


reload()
{
cd /home/mac1/scripts
bash variable.sh 
}

kill()
{
kill -9  
}

status()
{
#ps -ef | grep -i minikube
docker container ls  | grep -i minikube
}

# Case statement

case ${action} in
	start)
start
#	echo " $instance service has been started " 
	;;
	stop)
stop
	echo " $instance service has been stopped "
	;;

	reload)
reload
	echo "service is been reload "
	;;
restart)
   $0 stop
   $0 start
   ;;

status)
status
#echo "current status for the $instance is $process  "
;;

*)
echo " invalid line agrument" 
;;
esac

# check to see if its alive
if [[ -z $ps ]]
then 
echo " $instance service has been stopped "
#echo " killing $instance service has been stopped (pid=$dead) " 
#kill $dead
#sleep 5
else
echo " $instance service are in running status "
fi

