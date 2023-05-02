#!/bin/bash

# Tema para GRUB-2.

ROOT_UID=0
THEME_DIR="/usr/share/grub/themes"
THEME_NAME=dark_squares

MAX_DELAY=20                                        # Atraso máximo para o usuário digitar a senha root.

# CORES
CDEF=" \033[0m"                                     # Cor padrão.
CCIN=" \033[0;36m"                                  # Cor da informação.
CGSC=" \033[0;32m"                                  # Cor de sucesso.
CRER=" \033[0;31m"                                  # Cor de erro.
CWAR=" \033[0;33m"                                  # Cor de alerta.
b_CDEF=" \033[1;37m"                                # Cor padrão em negrito.
b_CCIN=" \033[1;36m"                                # Cor de informação em negrito.
b_CGSC=" \033[1;32m"                                # Cor ousada de sucesso.
b_CRER=" \033[1;31m"                                # Cor de erro em negrito.
b_CWAR=" \033[1;33m"                                # Cor de aviso em negrito.

# Tipo de sinalizador e cores de mensagem de exibição.
prompt () {
  case ${1} in
    "-s"|"--success")
      echo -e "${b_CGSC}${@/-s/}${CDEF}";;          # Imprimir mensagem de sucesso.
    "-e"|"--error")
      echo -e "${b_CRER}${@/-e/}${CDEF}";;          # Imprimir mensagem de erro.
    "-w"|"--warning")
      echo -e "${b_CWAR}${@/-w/}${CDEF}";;          # Imprimir mensagem de aviso.
    "-i"|"--info")
      echo -e "${b_CCIN}${@/-i/}${CDEF}";;          # Imprimir mensagem de informação.
    *)
    echo -e "$@"
    ;;
  esac
}

# Mensagem de boas-vindas.
prompt -s "\n\t*******************************\n\t*  ${THEME_NAME} - Tema GRUB-2  *\n\t*******************************"

# Verifique a disponibilidade do comando.
function has_command() {
  command -v $1 > /dev/null
}

prompt -w "\nVerificando o acesso ROOT ...\n"

# Verificando o acesso ROOT e prossiga se estiver presente.
if [ "$UID" -eq "$ROOT_UID" ]; then

# Criar diretório de temas, se não existir
  prompt -i "\nVerificando a existência do diretório de temas...\n"
  [[ -d ${THEME_DIR}/${THEME_NAME} ]] && rm -rf ${THEME_DIR}/${THEME_NAME}
  mkdir -p "${THEME_DIR}/${THEME_NAME}"

# Copiar Tema.
  prompt -i "\nInstalando ${THEME_NAME} tema...\n"

  cp -a ${THEME_NAME}/* ${THEME_DIR}/${THEME_NAME}

# Definir Tema.
  prompt -i "\nDefinindo ${THEME_NAME} como padrão...\n"

# Configuração de Backup do GRUB.
  cp -an /etc/default/grub /etc/default/grub.bak

  grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub

  echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >> /etc/default/grub

# Atualizar configuração do GRUB.
  echo -e "Atualizando a configuração do GRUB..."
  if has_command update-grub; then
    update-grub
  elif has_command grub-mkconfig; then
    grub-mkconfig -o /boot/grub/grub.cfg
  elif has_command grub2-mkconfig; then
    if has_command zypper; then
      grub2-mkconfig -o /boot/grub2/grub.cfg
    elif has_command dnf; then
      grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
    fi
  fi

# Mensagem de sucesso.
  prompt -s "\n\t          ***************\n\t          *  Tudo feito!  *\n\t          ***************\n"

else

# Mensagem de erro.
  prompt -e "\n [ Erro! ] -> Execute-me como ROOT "

# Execução persistente do script como ROOT.
  read -p "[ Confiável ] Especifique a senha de ROOT : " -t${MAX_DELAY} -s
  [[ -n "$REPLY" ]] && {
    sudo -S <<< $REPLY $0
  } || {
    prompt  "\n Operação cancelada, Tchau =D"
    exit 1
  }
fi
