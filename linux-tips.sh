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
    if [ $(whoami) == $(getfacl ~/server-technologies-part-2/linux-tips.sh | sed -n "s/.*owner: //p") ]
    then
        echo
        read -p 'Disable for all or certain user?(all/user): ' answer
        if [ $answer == "all" ]
        then
            script_path=$(sed -n '/linux-tips\.sh/p' ~/.bashrc)
            sed -i "s|$script_path|# $script_path|" ~/.bashrc
        elif [ $answer == "user" ]
        then
            read -p 'Name of the user: ' name
            setfacl -m u:$name:--- $script_path
        fi
    else
        script_path=$(sed -n '/linux-tips\.sh/p' ~/.bashrc)
        sed -i "s|$script_path|# $script_path|" ~/.bashrc
    fi
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
        if [ $(whoami) == $(getfacl ~/server-technologies-part-2/linux-tips.sh | sed -n "s/.*owner: //p") ]
        then
            echo
            read -p 'Disable for all or certain user?(all/user): ' answer
            if [ $answer == "all" ]
            then
                script_path=$(sed -n '/linux-tips\.sh/p' ~/.bashrc)
                sed -i "s|$script_path|# $script_path|" ~/.bashrc
            elif [ $answer == "user" ]
            then
                read -p 'Name of the user: ' name
                setfacl -m u:$name:--- $script_path
            fi
        else
            script_path=$(sed -n '/linux-tips\.sh/p' ~/.bashrc)
            sed -i "s|$script_path|# $script_path|" ~/.bashrc
        fi
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