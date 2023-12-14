#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: plese run this script with root access"
    exit 1 # you can give other then 0
else
    echo "you are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "error:: installing mysql is failed"
    exit 1
else
    echo "installing Mysql is success"
fi