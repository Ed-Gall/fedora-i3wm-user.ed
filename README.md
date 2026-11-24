# Personalização do Fedora com i3WM

Este minha personalização básica para o Fedora com **i3WM**.

---

## 1. Ativar os repositórios RPM Fusion (Free e Non-Free)

Essêncial para qualquer coisa no Fedora.

```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Também faça a instalação do fuse, alguns appimage pode precisar.

```bash
sudo dnf install fuse-libs-2.9.9
```

---

## 2. Instalar o Flatpak e adicionar o repositório Flathub

Opcional caso queira usar Flatpak.

```bash
sudo dnf install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

---

## 3. Instalar tema de ícones Tela

O tema **Tela** é um conjunto de ícones.

```bash
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh
```

> Você pode passar opções ao script `install.sh` para instalar apenas variantes específicas. Veja a [documentação oficial](https://github.com/vinceliuice/Tela-icon-theme) para mais detalhes.

---

## 4. Instalar tema de cursor Bibata

```bash
cd /tmp
wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz
```

Extraia o arquivo:

```bash
tar -xJf Bibata-Modern-Classic.tar.xz
```
Crie a pasta de temas de ícones:

```bash
mkdir -p ~/.local/share/icons
```

```bash
mv Bibata-Modern-Classic ~/.local/share/icons/
```




---

> Após instalar os temas, use ferramentas como `lxappearance`. A maioria estão pré-configuradas nos arquivos deste repositório.

## 5. Wallpaper com `feh`

O [`feh`](https://feh.finalrewind.org/) é o visualizador de imagens que o i3 no fedora usa para definir wallpapers.

Modifique a seguinte linha no seu arquivo `~/.config/i3/config`:

```bash
# feh (serviço de wallpaper)
exec_always --no-startup-id feh --bg-scale /caminho/para/sua/imagem.png
```
## 6. VS Code

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code
```

## 7. Tex

```bash
sudo dnf install texlive-scheme-full
```
## 8. Tema Arc-Dark

```bash
sudo dnf install arc-theme gtk-murrine-engine lxappearance
```
## 9. Problema com flameshot

lameshot v14 ou superior está tentando usar o XDG Desktop Portal, mas seu i3wm não disponibiliza o serviço de captura necessário.

```bash
mkdir -p ~/.config/flameshot
nano ~/.config/flameshot/flameshot.ini
```

Coloque exatamente e depois salve:


```bash
[General]
useX11LegacyScreenshot=true
```

## 10. Polybar não iniciando

Dê permissão de execução:

```bash
chmod +x ~/.config/polybar/launch.sh
```

## 11. Wallpaper no LightDM

Antes de tudo, mova o wallpaper para uma pasta onde o LightDM tenha permissão, eu recomendo: /usr/share/backgrounds

Execute:

```bash
grep -E 'greeter-session|user-session' /etc/lightdm/lightdm.conf
```

```bash
ls /usr/share/xgreeters/
```

Se aparecer lightdm-gtk-greeter.desktop, você utiliza o GTK Greeter.

```bash
sudo nano /etc/lightdm/lightdm-gtk-greeter.conf
```

Configuração do greeter:

```bash
[greeter]

background=[sua imagem].png

theme-name=Arc-Dark

icon-theme-name=Adwaita

font-name=Noto Sans 10

xft-antialias=true
```
