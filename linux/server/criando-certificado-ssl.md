### Gerar certificado ssl com auto-renew

```bash
  sudo apt update
  sudo apt install certbot -y
  sudo apt install certbot python3-certbot-apache -y
  sudo certbot --apache
  sudo certbot renew --dry-run # testa o auto-renew
```
O local dos certificados fica em `/etc/letsencrypt/live/seu-dominio/`