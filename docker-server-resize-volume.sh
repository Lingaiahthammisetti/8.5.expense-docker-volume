#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
echo  -e "$G Script started executing at:$TIMESTAMP $N"

VALIDATE(){
if [ $1 -ne 0 ]
then 
   echo -e "$R $2... FAITURE $N"
   exit 1
else
   echo -e "$G $2..  SUCCESS $N"
fi
}
#checking root user or not.
if [ $USERID -ne 0 ]
then
   echo -e "$R Please run this script with root access $N"
   exit 1
else
   echo -e "$G You are super user. $SCRIPT_NAME"

fi 
echo "******* Resize EBS Storage ****************"
# ec2 instance creation request for Docker expense project
# =============================================
# RHEL-9-DevOps-Practice
# t3.micro
# allow-everything
# 50 GB

lsblk &>>$LOGFILE
VALIDATE $? "check the partitions"

sudo growpart /dev/nvme0n1 4 &>>$LOGFILE #t3.micro used only
VALIDATE $? "growpart to resize the existing partition to fill the available space"

sudo lvextend -l +50%FREE /dev/RootVG/rootVol &>>$LOGFILE
VALIDATE $? "Extend the Logical Volumes Decide how much space to allocate to each logical volume."

sudo lvextend -l +50%FREE /dev/RootVG/varVol &>>$LOGFILE
VALIDATE $? "Extend the Logical Volumes Decide how much space to allocate to each logical volume.-2"

sudo xfs_growfs / &>>$LOGFILE
VALIDATE $? "For the root filesystem:"

sudo xfs_growfs /var &>>$LOGFILE
VALIDATE $? "For the /var filesystem:"