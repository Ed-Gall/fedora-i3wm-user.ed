# Personalização do Fedora com i3WM

Este documento reúne minha configuração básica do Fedora com **i3WM**,
incluindo repositórios, temas, ferramentas e algumas soluções para
problemas comuns.

------------------------------------------------------------------------

## 1. Ativar os repositórios RPM Fusion

Os repositórios **RPM Fusion Free** e **Nonfree** disponibilizam pacotes
que não são distribuídos nos repositórios oficiais do Fedora.

``` bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Instalar o FUSE

Alguns aplicativos no formato AppImage podem precisar do FUSE para
funcionar.

``` bash
sudo dnf install fuse-libs-2.9.9
```

------------------------------------------------------------------------

## 2. Instalar o Flatpak e adicionar o Flathub

Esta etapa é opcional e necessária apenas se você pretende instalar
aplicativos usando Flatpak.

``` bash
sudo dnf install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

------------------------------------------------------------------------

## 3. Instalar o tema de ícones Tela

O **Tela** é um conjunto de ícones para personalizar a aparência do
ambiente gráfico.

``` bash
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh
```

> O script `install.sh` aceita opções para instalar variantes
> específicas. Consulte a [documentação oficial do
> Tela](https://github.com/vinceliuice/Tela-icon-theme) para conhecer as
> opções disponíveis.

------------------------------------------------------------------------

## 4. Instalar o tema de cursor Bibata

Baixe o tema **Bibata Modern Classic**:

``` bash
cd /tmp
wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz
```

Extraia o arquivo:

``` bash
tar -xJf Bibata-Modern-Classic.tar.xz
```

Crie o diretório de temas de ícones, caso ainda não exista:

``` bash
mkdir -p ~/.local/share/icons
```

Mova o tema para o diretório:

``` bash
mv Bibata-Modern-Classic ~/.local/share/icons/
```

> Após instalar os temas, utilize ferramentas como o `lxappearance` para
> selecionar e configurar a aparência. A maioria das opções visuais já
> está pré-configurada nos arquivos deste repositório.

------------------------------------------------------------------------

## 5. Configurar o wallpaper com feh

O [`feh`](https://feh.finalrewind.org/) é um visualizador de imagens que
também pode ser utilizado para definir o papel de parede no i3WM.

Adicione a seguinte linha ao arquivo `~/.config/i3/config`:

``` bash
# feh — serviço de wallpaper
exec_always --no-startup-id feh --bg-scale /caminho/para/sua/imagem.png
```

Substitua `/caminho/para/sua/imagem.png` pelo caminho da imagem que
deseja utilizar.

------------------------------------------------------------------------

## 6. Instalar o Visual Studio Code

Adicione o repositório oficial da Microsoft e instale o VS Code:

``` bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf install code
```

------------------------------------------------------------------------

## 7. Instalar o TeX Live

Para instalar a distribuição completa do TeX Live:

``` bash
sudo dnf install texlive-scheme-full
```

------------------------------------------------------------------------

## 8. Instalar o tema Arc-Dark

Instale o tema **Arc-Dark**, o mecanismo GTK necessário e a ferramenta
de configuração visual:

``` bash
sudo dnf install arc-theme gtk-murrine-engine lxappearance
```

------------------------------------------------------------------------

## 9. Corrigir o problema de captura de tela do Flameshot

O Flameshot 14 ou superior pode tentar utilizar o **XDG Desktop Portal**
para capturar a tela. Em uma sessão i3WM, o serviço de captura
necessário pode não estar disponível ou configurado.

Crie o diretório de configuração:

``` bash
mkdir -p ~/.config/flameshot
```

Abra o arquivo de configuração:

``` bash
nano ~/.config/flameshot/flameshot.ini
```

Adicione o seguinte conteúdo:

``` ini
[General]
useX11LegacyScreenshot=true
```

Salve o arquivo e tente executar o Flameshot novamente.

------------------------------------------------------------------------

## 10. Corrigir o Polybar que não inicia

Caso o script de inicialização do Polybar não tenha permissão de
execução, conceda-a com:

``` bash
chmod +x ~/.config/polybar/launch.sh
```

------------------------------------------------------------------------

## 11. Configurar o wallpaper do LightDM

Para configurar o papel de parede da tela de login, primeiro mova a
imagem para um diretório acessível pelo LightDM. Recomendo utilizar:

``` bash
/usr/share/backgrounds
```

### Verificar a configuração do LightDM

Execute:

``` bash
grep -E 'greeter-session|user-session' /etc/lightdm/lightdm.conf
```

Liste os greeters disponíveis:

``` bash
ls /usr/share/xgreeters/
```

Se aparecer `lightdm-gtk-greeter.desktop`, você está utilizando o **GTK
Greeter**.

### Editar a configuração do GTK Greeter

Abra o arquivo:

``` bash
sudo nano /etc/lightdm/lightdm-gtk-greeter.conf
```

Configure o greeter:

``` ini
[greeter]

background=/usr/share/backgrounds/[sua-imagem].png

theme-name=Arc-Dark
icon-theme-name=Adwaita
font-name=Noto Sans 10
xft-antialias=true
```

Substitua `/usr/share/backgrounds/[sua-imagem].png` pelo caminho
completo da imagem escolhida.

------------------------------------------------------------------------

## Observações

-   Os comandos foram organizados por finalidade para facilitar a
    consulta.
-   Ajuste os caminhos de arquivos e imagens de acordo com a sua
    instalação.
-   Algumas configurações podem exigir que você reinicie a sessão
    gráfica para que as alterações sejam aplicadas.
