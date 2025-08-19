1. Crie um serviço:
```
sudo nano /etc/systemd/system/make-at-boot.service
```
2. Coloque isso (substitua **SEU_USUARIO** pelo seu usuário do Ubuntu):
```
[Unit]
Description=Rodar make na inicialização
After=network.target

[Service]
Type=oneshot
User=SEU_USUARIO
WorkingDirectory=/home/SEU_USUARIO
ExecStart=/usr/bin/make
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
```
3. Recarregue o systemd:
```
sudo systemctl daemon-reload
```
4. Ative o serviço no boot:
```
sudo systemctl enable make-at-boot.service
```
5. Teste manualmente sem reiniciar:
 ```
sudo systemctl start make-at-boot.service
```

IMportante o primeiro comando make deve ser o de subir o container.
