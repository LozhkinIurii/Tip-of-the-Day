#! /bin/bash

if  ! [[ -s ~/tip-count.txt && $(cat ~/tip-count.txt) =~ ^([1-9]|10)$ ]]
then
    echo 1 > ~/tip-count.txt
fi

tip=$(cat ~/tip-count.txt)
tip_num="\033[93mTip number $tip\033[0m"
echo Tip of the day:
echo -e "$tip_num"
echo
cat ~/tips/${tip}.txt
if [ $tip -eq 10 ]
then
    echo 1 > ~/tip-count.txt
else
    echo $(($tip+1)) > ~/tip-count.txt
fi
echo
echo
read -p 'Show next tip or disable totd functionality?(y/n/disable): ' answer
if [ $answer == "disable" ]
then
    script_path=$(sed -n '/linux-tips\.sh/p' ~/.bashrc)
    sed -i "s|$script_path|# $script_path|" ~/.bashrc
fi

while [ $answer == "y" ]
do
    echo
    tip=$(cat ~/tip-count.txt)
    tip_num="\033[93mTip number $tip\033[0m"
    echo -e "$tip_num"
    cat ~/tips/${tip}.txt

    if [ $tip -eq 10 ]
    then
        echo 1 > ~/tip-count.txt
    else
        echo $(($tip+1)) > ~/tip-count.txt
    fi

    echo
    echo
    read -p 'Show next tip or disable totd functionality?(y/n/disable): ' answer
    if [ $answer == "disable" ]
    then
        script_path=$(sed -n '/linux-tips\.sh/p' ~/.bashrc)
        sed -i "s|$script_path|# $script_path|" ~/.bashrc
    fi
done
if [ $tip -eq 10 ]
then
    echo 1 > ~/tip-count.txt
else
    echo $(($tip+1)) > ~/tip-count.txt
fi
echo
echo