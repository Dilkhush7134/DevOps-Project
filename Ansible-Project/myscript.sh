#!/bin/bash
hostname
output_file="/tmp/output.txt"

{
    hostname
    echo "IP REACHABILITY TEST: "
    ping -c 4 google.com
    ping -c 4 facebook.com

    echo "INTERFACE DETAILS: "
    ifconfig -a

    echo "Creating folder and files in /tmp directory"
    mkdir -p /tmp/boby
    truncate -s 100M /tmp/boby/album{1,2}

    echo "Creating and compressing tar file"
    tar -cvf /tmp/boby/mytarfile.tar -C /tmp/boby .
    gzip /tmp/boby/mytarfile.tar
} >> "$output_file"
