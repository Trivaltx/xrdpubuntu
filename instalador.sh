#!/bin/bash
##
## script criado com a finalidade de instalar a GUI XFCE4 (Xubuntu desktop) em uma vps Ubuntu e configurar o acesso remoto via XRDP
## o acesso remoto pode ser feito utilizando o programa "area de trabalho remota" do Windows
## ou algum outro programa compativel com o protocolo RDP
##
##
echo "## atualizando repositorios..."
apt -qq update -y
echo "## instalando interface grafica..."
apt -qq install xubuntu-core^ -y
echo "## instalando demais programas/dependencias..."
apt -qq install xfce4 --no-install-recommends -y
apt -qq install xrdp xorg dbus-x11 x11-xserver-utils python3 python3-pip zip git ffmpeg thunar-archive-plugin firefox -y
echo "## terminando as configurações..."
sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh
ufw allow 3389/tcp
/etc/init.d/xrdp restart

