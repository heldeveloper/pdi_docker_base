#!/bin/bash
echo "====================================================================================="
echo " PDI DOCKER START  9.1 Recendo Variaveis                                             "
echo "====================================================================================="

git_url=$1
project=$2
obj=$3
ext="${obj:(-4)}"

echo "====================================================================================="
echo " GIT clone                                                                           "
echo "====================================================================================="
# Git Clone repositório dentro da variavel KETTLE REPOSITORY
git clone $git_url $USER_KETTLE_REPOSITORY


echo "====================================================================================="
echo " Start PDI  Job ou transormação                                                      "
echo "====================================================================================="
# Define pela extensão o tipo de ação a ser executado no Pentaho
case $ext in
     .ktr)
         sh $USER_KETTLE_HOME/pan.sh -file=$USER_KETTLE_REPOSITORY/$project/$obj --norepo;; #Inicar Transformação
     .kjb)
         sh $USER_KETTLE_HOME/kitchen.sh -file=$USER_KETTLE_REPOSITORY/$project/$obj --norepo;; #Iniciar tarefa
     *) 
         echo 'Error in start script';
esac