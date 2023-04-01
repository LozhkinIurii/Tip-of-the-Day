show_tip(){
    tip_count_path=~/.tip-count
    totd_tips_path=/opt/tip_of_the_day_bash_script/tips

    if  ! [[ -s $tip_count_path && $(cat $tip_count_path) =~ ^([1-9]|10)$ ]]
    then
        echo 1 > $tip_count_path
    fi

    tip=$(cat $tip_count_path)
    tip_num="\033[93mTip number $tip\033[0m"
    echo "==============================================================="
    echo Tip of the day:
    echo -e "$tip_num"
    echo
    cat $totd_tips_path/${tip}.txt
    if [ $tip -eq 10 ]
    then
        echo 1 > $tip_count_path
    else
        echo $(($tip+1)) > $tip_count_path
    fi
    echo
    echo "==============================================================="
    read -p "Press 'y' to show next tip, press any other button to quit: " answer
    while [ $answer == "y" ]
    do
        clear
        tip=$(cat $tip_count_path)
        tip_num="\033[93mTip number $tip\033[0m"
        echo "================================================================="
        echo -e "$tip_num"
        cat $totd_tips_path/${tip}.txt
        if [ $tip -eq 10 ]
        then
            echo 1 > $tip_count_path
        else
            echo $(($tip+1)) > $tip_count_path
        fi

        echo
        echo "================================================================="
        read -p "Press 'y' to show next tip, press any other button to quit: " answer
    done

    if [ $tip -eq 10 ]
    then
        echo 1 > $tip_count_path
    else
        echo $(($tip+1)) > $tip_count_path
    fi
    echo
    echo
}


if [ ! -f .notips ]
then
    answer="y"
    while [ $answer == "y" ]
    do
        show_tip
    done
fi