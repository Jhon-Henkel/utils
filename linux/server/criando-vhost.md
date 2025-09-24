<img width="2540" height="1365" alt="image" src="https://github.com/user-attachments/assets/59072046-3e2c-4518-a7fd-3ef79ac0c38f" />### Criando o vhost com SSL
```bash
  sudo a2enmod proxy
  sudo a2enmod proxy_http
  sudo a2enmod ssl
  sudo a2enmod headers
  sudo vim /etc/apache2/sites-available/[FILENAME].conf
```

Conteúdo do arquivo:
```
<VirtualHost *:[PORTA_WEB]>
ServerName [URL_DO_SERVIDOR]
ServerAdmin webmaster@localhost

    SSLEngine on
    SSLCertificateFile [CAMINHO PARA O fullchain.pem]
    SSLCertificateKeyFile [CAMINHO PARA O privkey.pem]
    Include /etc/letsencrypt/options-ssl-apache.conf

    ProxyPreserveHost On
    ProxyPass / http://127.0.0.1:[PORTA INTERNA]/
    ProxyPassReverse / http://127.0.0.1:[PORTA INTERNA]/

    ErrorLog ${APACHE_LOG_DIR}/[FILENAME]-error.log
    CustomLog ${APACHE_LOG_DIR}/[FILENAME]-access.log combined
</VirtualHost>
```
```bash
  sudo vim /etc/apache2/ports.conf 
```
Adicionar o `Listen [PORTA_WEB]`
```bash
sudo a2ensite [FILENAME].conf
sudo apache2ctl configtest
sudo systemctl restart apache2
```
