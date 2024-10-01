#!/usr/bin/bash

# Usage message
usage() {
    echo "Usage: $0 -d <database> -u <username>"
    echo "Usage: $0 -d <database> -e <email>"
    exit 1
}

# Check if arguments are passed
if [[ $# -eq 0 ]]; then
    usage
fi

# Parse command-line arguments
while getopts d:u:e: flag
do 
    case "${flag}" in
        d) database=${OPTARG};;
        u) username=${OPTARG};;
        e) email=${OPTARG};;
        *) usage ;; # Handle invalid flags
    esac
done

if [[ -z $database ]]; then
    echo "Error: Database must be specifed."
    usage
fi

# Check if username or email is provided and scan database with grep
if [[ -n $username ]]; then
    grep --color=always "$username" "$database"
fi

if [[ -n $email ]]; then 
    grep --color=always "$email" "$database"
fi
