<VirtualHost *:80>
    ServerName integration.techresidents.com
    Include /opt/tr/www/techresidents.com/integration/techresidents_web/apache/integration.conf
</VirtualHost>

<VirtualHost *:443>
    ServerName integration.techresidents.com
    NameVirtualHost *:443

    #SSL Settings
    SSLEngine on
    SSLOptions +StrictRequire
    SSLProxyEngine on
    SSLProtocol -all +TLSv1 +SSLv3
    SSLCipherSuite HIGH:MEDIUM:!aNULL:+SHA1:+MD5:+HIGH:+MEDIUM
    SSLCertificateFile /opt/tr/www/techresidents.com/ssl/integration.techresidents.com.pem.crt
    SSLCertificateKeyFile /opt/tr/www/techresidents.com/ssl/integration.techresidents.com.pem.key
    #SSLCertificateChainFile /opt/tr/www/techresidents.com/ssl/verisign_intermediate_CA.crt
	
    <Directory />
        SSLRequireSSL
    </Directory>

    Include /opt/tr/www/techresidents.com/prod/techresidents_web/apache/integration.ssl.conf
</VirtualHost>
