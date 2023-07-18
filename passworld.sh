#!/bin/bash

help() 
{
    echo ""
    echo "Welcome to passworld! Here's how to use this password manager."
    echo "" 
    echo "- Add an entry with  passworld add [[resource]]"
    echo "- Get an entry with  passworld get [[resource]]"
    echo ""
}

add()
{
    if [[ $1 ]]; then 
        local account=$1
        echo "adding" $account 

        echo "User name: "
        read user

        echo "Would you like to generate a secure password? [[Y]]/n"
        read gen
        if [[ gen == "N" ]] || [[ gen == "n" ]] || [[ gen == "no" ]]; then 
            echo "Enter your own password: "
            read pw
        elif [[ !gen ]] || [[ gen == "Y" ]] || [[ gen == "y" ]] || [[ gen == "yes" ]]; then 
            echo "TODO: call openssl"
            local pw="p@\$\$w0RD"
        else
            echo "TODO: you failed to answer correctly" 
            return 1
        fi 

        echo "saving info for " 
        echo $account
        echo "User:" $user
        echo "Pswd:" $pw
    else 
        echo "Missing arg!"
        help
    fi 
}

get()
{
    if [[ $1 ]]; then 
        echo "getting" $1
    else 
        echo "Missing arg!"
        help
    fi 
}

list() 
{
    echo "All items: " 
}


# main
if [[ $1 ]]; then 
    if [[ $1 == "add" ]]; then 
        add $2
    elif [[ $1 == "get" ]]; then 
        get $2
    elif [[ $1 == "list" ]]; then
        list
    else
        echo "Missing function!"
        help
    fi 
else 
    help
fi 

