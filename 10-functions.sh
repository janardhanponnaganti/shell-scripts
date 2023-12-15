#!/bin/bash
ID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: $2...failed"
        exit 1
    else
        echo "$2 success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: plese run this script with root access"
    exit 1 # you can give other then 0
else
    echo "you are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y

VALIDATE $? "installing MYsql"

yum install git

VALIDATE $? "installing git"