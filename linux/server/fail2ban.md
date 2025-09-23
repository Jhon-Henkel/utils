## Instalar o fail2ban

Serviço para evitar força bruta de login no ssh.

```bash
  sudo apt update
  sudo apt install fail2ban -y
  sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
  sudo nano /etc/fail2ban/jail.local
```
Procurar a chave [sshd] e alterar os valores para:
```
[sshd]
enabled  = true
port     = ssh
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 5
bantime  = 3600
findtime = 600
```

Rodar os comandos:
```bash
  sudo systemctl enable fail2ban
  sudo systemctl start fail2ban
  sudo systemctl status fail2ban
```