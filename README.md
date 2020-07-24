# Instalação e configuração! 

```
git clone https://github.com/k4k4rot0/Dark_Squares.git
```

**Veja se tem o diretório thema** 

```
ls /usr/share/grub/themes
```

**Se caso não tiver crie ele**

```
sudo mkdir /usr/share/grub/themes
```

**Vamos copicar o tema**

```
sudo cp -r dark_squares/ /usr/share/grub/themes
```

**Abra o arquivo:** 

```
sudo nano /etc/default/grub 
```

**e adicione:** 

```
GRUB_THEME = "/usr/share/grub/themes/dark_squares/theme.txt"
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

![screenshot](/imagens/logo.png)

_Sinta-se livre para copiar o tema e fazer sua própria alteração!;-)_
