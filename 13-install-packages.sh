#!/bin/bash

ID=$(id -u)
R="\e[31m"
Y="\e[33m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2... $R failed $N"
    else
        echo -e "$2 ... $G success $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: plese run this script with root access"
    exit 1 # you can give other then 0
else
    echo "you are root user"
fi # fi means reverse of if, indicating condition end

#echo "all arguments passed: $@"
# git mysql postfix net-tools
# package=git for frist time

for package in $@
do
    yum install mysql $package &>> $LOGFILE # check install or not
    if [ $? -ne 0] #if not installed
    then 
        yum install $package -y &>> LOGFILE # install the package
        VALIDATE $? "installing of $package" # validate
    else
         echo -e "$package is already installed ...$Y SKIPPING $N"
    fi
done