#!/bin/bash

# Prompt the user for the website name
read -p "Enter the website name: " website_name

# Check SSL session cache status every second
while sleep 1; do
    # Run openssl s_client command to establish an SSL/TLS connection to the website
    # and check the number of reused sessions
    reused_sessions=$(openssl s_client -connect $website_name:443 -reconnect -no_ticket -sess_out /dev/null -sess_in /dev/null 2>&1 | grep 'Reuse session' | wc -l)

    # Print the date and time along with the number of reused sessions
    echo "$(date +"%Y-%m-%d %H:%M:%S") $reused_sessions $website_name"
done

# Fun fact: I used chatgpt to beautify the code. :P