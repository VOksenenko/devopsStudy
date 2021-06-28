#!/bin/bash
# Checking for provided arguments.
# If no arguments, show echo message. Otherwise run the rest of script.
if [ $# -ne 1 ]; then 
    echo "Only one argument required to run the script."
    else

        # Getting number of minutes from provided argument
        MIN=$(( $1 - 1 ))

        # While amount of minutes greater than 0 we countdown seconds 59..0 and decrease minutes by 1.
        while [ $MIN -ge 0 ]; do

            #set seconds
            SEC=59

            # Show remaining  time in format mm:ss by using printf function.
            # Special character \033[0K represents an end of line which cleans the rest of line
            # if there are any characters left from previous output.
            # \r is a carriage return which moves the cursor to the beginning of the line.
            while [ $SEC -ge 0 ]; do
                printf "There are $MIN:%02d\033[0K seconds remaining.\r" $SEC
                SEC=$((SEC-1))
                sleep 1
            done
            MIN=$((MIN-1))
        done
        # If no minutes and seconds remaining show final message.
        printf "The time is over!\033[0K\r" 
        sleep 1
fi
