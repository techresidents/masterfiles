#!/bin/bash

usage()
{
    echo "Given an AES 256 bit (cbc / nosalt) encrypted file containing a password,"
    echo "and an encryption key file, outputs the password to stdout."
    echo ""
    echo "usage: `basename $0` <encrypted_password_file> <encryption_key_file>"
    exit 2
}

if [ $# -ne 2 ]
then
    usage
fi

encrypted_password_file=$1
encryption_key_file=$2

password=$(openssl enc -d -aes-256-cbc -nosalt -in $encrypted_password_file -pass file:$encryption_key_file)
echo $password
