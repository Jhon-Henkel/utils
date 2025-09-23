## Criar serviço no ubuntu

Trocar o **[MEUAPP]** pelo nome do seu serviço.

```bash
  sudo vim /etc/systemd/system/[MEUAPP].service
```

Colar o seguinte conteúdo (exemplo)
```
After=network.target

[Service]
ExecStart=/home/azureuser/services/entrypoint/entrypoint
WorkingDirectory=/home/azureuser/services/entrypoint
Restart=always
User=root
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=false
Environment=GIN_MODE=release
EnvironmentFile=/home/azureuser/services/entrypoint/.env

[Install]
WantedBy=multi-user.target
```
Rodar os seguintes comandos:
```bash
  sudo systemctl daemon-reload
  sudo systemctl enable [MEUAPP]
  sudo systemctl start [MEUAPP]
  sudo journalctl -u [MEUAPP] -f # Esse comando serve para ver logs.
```