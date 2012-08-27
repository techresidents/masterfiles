<VirtualHost *:80>
    ServerName staging.techresidents.com
    Include /opt/tr/www/techresidents.com/staging/techresidents_web/apache/staging.conf
</VirtualHost>

<VirtualHost *:443>
    ServerName staging.techresidents.com
    NameVirtualHost *:443

    #SSL Settings
    SSLEngine on
    SSLOptions +StrictRequire
    SSLProxyEngine on
    SSLProtocol -all +TLSv1 +SSLv3
    SSLCipherSuite HIGH:MEDIUM:!aNULL:+SHA1:+MD5:+HIGH:+MEDIUM
    SSLCertificateFile /opt/tr/www/techresidents.com/ssl/staging.techresidents.com.pem.crt
    SSLCertificateKeyFile /opt/tr/www/techresidents.com/ssl/staging.techresidents.com.pem.key
    #SSLCertificateChainFile /opt/tr/www/techresidents.com/ssl/verisign_intermediate_CA.crt
	
    <Directory />
        SSLRequireSSL
    </Directory>

    Include /opt/tr/www/techresidents.com/staging/techresidents_web/apache/staging.ssl.conf
</VirtualHost>
