#!/bin/bash

#Utility script for Apache mod_ssl which outputs the SSL cert password.
#This is intented to be used with the SSLPassPhraseDialog directive.
#i.e. SSLPassPhraseDialog "exec:/opt/tr/bin/sslpasswd.sh"
#
#/etc/httpd/conf/ssl.pwd and /etc/httpd/conf/ssl.pwd.key must only be root
#readable (600).
#
#This adds an extra level of security for the cert as it will require
#an attacker to obtain root privileges in order to obtain the
#cert password. Apache itself should not be running as root.
/opt/tr/bin/decpasswd.sh /etc/httpd/conf/ssl.pwd /etc/httpd/conf/ssl.pwd.key
