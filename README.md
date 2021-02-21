[![Meu Telegram](https://img.shields.io/badge/Meu-Telegram-red)](https://t.me/k4k4rot0)
![GitHub repo size](https://img.shields.io/github/repo-size/k4k4rot0/Dark_Squares?label=Tamanho)
![GitHub contributors](https://img.shields.io/github/contributors/k4k4rot0/login?color=yellow&label=contribuidores)
![GitHub](https://img.shields.io/github/license/k4k4rot0/Dark_Squares?label=Licença)
[![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

# Instalação e configuração! 

```
git clone https://github.com/k4k4rot0/Dark_Squares.git
```

**Entre na pasta do tema baixado**

```
cd Dark_Squares
```
**Veja se tem o diretório themes** 

```
ls /usr/share/grub/themes
```

**Caso não tenha, crie**

```
sudo mkdir /usr/share/grub/themes
```

**Copie o tema**

```
sudo cp -r dark_squares/ /usr/share/grub/themes
```

**Abra o arquivo:** 

```
sudo vim /etc/default/grub 
```

**Descomente e adicione:** 

```
GRUB_THEME="/usr/share/grub/themes/dark_squares/theme.txt"
```

**Atualize o GRUB:** 

```
sudo update-grub
```

**Ou:** 

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Fundo 

Abra a pasta do tema e substitua o arquivo “background.png” para o que você gosta (ele precisa ser o arquivo .png / .jpg) 


### Screenshot 

![screenshot](/imagens/logo-01.png)

![screenshot](/imagens/logo-02.png)

![screenshot](/imagens/logo-03.png)

_Sinta-se livre para copiar o tema e fazer sua própria alteração!;-)_
