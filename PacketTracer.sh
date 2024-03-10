#!/bin/bash

# Packet Tracer Tool

# Function to display menu
display_menu() {
    echo "Packet Tracer Tool"
    echo "1. Scan network using nmap"
    echo "2. Capture packets using tcpdump"
    echo "3. Ping a host"
    echo "4. Trace route to a host"
    echo "5. Open captured .pcap file"
    echo "6. Exit"
}

# Function to perform network scan using nmap
perform_nmap_scan() {
    echo "Enter the target IP range or host to scan:"
    read target
    sudo nmap $target
}

# Function to capture packets using tcpdump
capture_packets() {
    echo "Enter the interface to capture packets (e.g., eth0):"
    read interface
    echo "Enter the filename to save captured packets (e.g., capture.pcap):"
    read filename
    sudo tcpdump -i $interface -w $filename
    echo "Packets captured and saved to $filename"
}

# Function to ping a host
ping_host() {
    echo "Enter the IP address or hostname to ping:"
    read host
    ping $host
}

# Function to trace route to a host
trace_route() {
    echo "Enter the IP address or hostname to trace route to:"
    read host
    traceroute $host
}

# Function to open a .pcap file using Wireshark
open_pcap_file() {
    echo "Enter the path to the .pcap file:"
    read pcap_file
    wireshark $pcap_file
}

# Main function
main() {
    while true; do
        display_menu

        echo "Enter your choice:"
        read choice

        case $choice in
            1) perform_nmap_scan ;;
            2) capture_packets ;;
            3) ping_host ;;
            4) trace_route ;;
            5) open_pcap_file ;;
            6) exit ;;
            *) echo "Invalid option. Please select a valid option." ;;
        esac
    done
}

main
