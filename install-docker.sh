#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
       echo "$2...FAILURE"
       exit 1
    else
       echo "$2.. SUCCESS"
    fi    
}
#check whether root user or not.
if [ $USERID -ne 0 ]
then 
   echo "please run this script with root access."
   exit 1 #manaully exit if error comes.
else
   echo "you are super user."
fi

yum install yum-utils -y &>>$LOGFILE
VALIDATE $? "Installing utils packages"

yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo &>>$LOGFILE
VALIDATE $? "adding Docker repo"

yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &>>$LOGFILE
VALIDATE $? "Installing docker"

systemctl start docker &>>$LOGFILE
VALIDATE $? "Starting docker"

systemctl enable docker &>>$LOGFILE
VALIDATE $? "Enabling Docker"

usermod -aG docker ec2-user &>>$LOGFILE
VALIDATE $? "Adding ec2-user to docker group as secondary group"

echo -e "$R Logout and login again $N"

