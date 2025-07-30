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

### Manualmente
```bash
git clone https://github.com/ful1e5/Bibata_Cursor.git
```

### Ou via COPR

```bash
sudo dnf copr enable peterwu/rendezvous
sudo dnf install bibata-cursor-themes
```

---

> Após instalar os temas, use ferramentas como `lxappearance`. A maioria estão pré-configuradas nos arquivos deste repositório.

## Wallpaper com `feh`

O [`feh`](https://feh.finalrewind.org/) é o visualizador de imagens que o i3 no fedora usa para definir wallpapers.

Modifique a seguinte linha no seu arquivo `~/.config/i3/config`:

```bash
# feh (serviço de wallpaper)
exec_always --no-startup-id feh --bg-scale /caminho/para/sua/imagem.png
```
