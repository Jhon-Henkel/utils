### Processo totalmente manual
- Ler o arquivo setup.md e ir fazendo ação por ação manualmente

### Processo semi automatico
Em um determinado momento ao rodar o setup.sh, vai ser perguntado se quer definir o Oh my Zsh como shell padrão, digitar Y e depois escrever exit, voltando assim para a execução do setup.

O config-system.sh deve ser rodado sem sudo, mas em algum momento pode pedir a senha.

- Rodar os comandos:
  ```bash
  chmod +x setup.sh && chmod +x config-system.sh
  ```
  ```bash
  ./config-system.sh
  ```
  ```bash
  sudo ./setup.sh
  ```
- Definir os atalhos personalizados
  ```
  Nome: Diodom
  Comando: /usr/bin/diodon
  Tecla: <Super>v
  ```
  ```
  Nome: Flameshot
  Comando: /usr/bin/flameshot gui
  Tecla: Print
  ```

- Logar no Jetbrains toolbox e baixar o PHP Storm, Web Storm, Go Land e IntelliJ
