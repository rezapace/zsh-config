<div align="center">

# ⚡ zsh-config

**Konfigurasi Zsh personal yang ringan, cepat, dan siap pakai**

[![License](https://img.shields.io/github/license/rezapace/zsh-config?style=flat-square&color=blue)](https://github.com/rezapace/zsh-config/blob/master/LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/rezapace/zsh-config?style=flat-square&color=green)](https://github.com/rezapace/zsh-config/commits/master)
[![Stars](https://img.shields.io/github/stars/rezapace/zsh-config?style=flat-square&color=yellow)](https://github.com/rezapace/zsh-config/stargazers)
[![Forks](https://img.shields.io/github/forks/rezapace/zsh-config?style=flat-square&color=orange)](https://github.com/rezapace/zsh-config/network/members)
[![Release](https://img.shields.io/github/v/release/rezapace/zsh-config?style=flat-square&color=purple)](https://github.com/rezapace/zsh-config/releases)
[![Shell](https://img.shields.io/badge/shell-zsh-informational?style=flat-square&logo=gnu-bash&logoColor=white)](https://www.zsh.org/)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey?style=flat-square)](https://github.com/rezapace/zsh-config)

<br>

![Demo](https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/prompt-styles-high-contrast.png)

> Powered by **Zinit** + **Powerlevel10k** + **fzf** — terminal yang produktif dalam satu file konfigurasi.

</div>

---

## 📖 About

`zsh-config` adalah dotfile `.zshrc` yang dirancang untuk developer yang ingin terminal cepat, cantik, dan fungsional tanpa setup yang rumit. Semua plugin dikelola oleh **Zinit** dan akan terinstall otomatis saat pertama kali dijalankan.

Cocok untuk **Linux server**, **WSL**, maupun **macOS**.

---

## ✨ Fitur

- 🚀 **Zinit** — plugin manager modern, lazy-load otomatis
- 🎨 **Powerlevel10k** — tema prompt dengan instant prompt
- 🖍️ **Syntax highlighting** — warna real-time saat mengetik perintah
- 💡 **Autosuggestions** — saran perintah dari histori
- 🔍 **fzf** — fuzzy finder terintegrasi
- 📁 **Directory jump** — `z`, `fasd`, `autojump`
- 🌈 **LS_COLORS** — warna output `ls` yang kaya
- 📜 **Histori 10.000 baris** — no duplicate, shared antar sesi
- 🛠️ **Custom functions** — `gupp`, `grel`, `mkdirg`, `cpg`, `mvg`, dll
- 🌐 **Go + NVM** — environment path sudah terkonfigurasi

---

## 🚀 Instalasi Cepat

### 1. Install dependensi sistem

```bash
sudo apt update && sudo apt upgrade -y
```

```bash
sudo apt install -y curl git gh btop nano zsh build-essential ca-certificates \
  && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash \
  && export NVM_DIR="$HOME/.nvm" && . "$NVM_DIR/nvm.sh" \
  && nvm install --lts && nvm alias default 'lts/*'
```

### 2. Clone dan pasang konfigurasi

```bash
# Clone repo
git clone https://github.com/rezapace/zsh-config.git ~/zsh-config

# Backup .zshrc lama (opsional)
cp ~/.zshrc ~/.zshrc.bak

# Copy ke .zshrc
cp ~/zsh-config/.zsh ~/.zshrc
```

### 3. Jalankan Zsh

```bash
zsh
```

> Zinit akan otomatis terinstall dan semua plugin diunduh saat pertama kali dijalankan.

---

## 🔌 Plugin

| Plugin | Fungsi |
|---|---|
| `romkatv/powerlevel10k` | Tema prompt modern |
| `zsh-users/zsh-syntax-highlighting` | Highlight perintah real-time |
| `zsh-users/zsh-autosuggestions` | Saran dari histori |
| `zsh-users/zsh-completions` | Tab completion tambahan |
| `marlonrichert/zsh-autocomplete` | Autocomplete real-time |
| `rupa/z` | Jump ke direktori sering dikunjungi |
| `clvv/fasd` | Akses cepat file & direktori |
| `wting/autojump` | Directory jumper |
| `trapd00r/LS_COLORS` | Warna output `ls` |
| `OMZP::git` | Alias git dari Oh My Zsh |
| `OMZP::sudo` | Tekan `Esc` 2x untuk tambah `sudo` |
| `OMZP::command-not-found` | Saran perintah yang tidak ditemukan |

---

## 🏷️ Alias

| Alias | Perintah | Keterangan |
|---|---|---|
| `h` | `cd ~` | Ke home directory |
| `v` | `code .` | Buka VS Code di direktori saat ini |
| `c` | `clear` | Bersihkan terminal |
| `hapus` | `rm -rf` | Hapus paksa |
| `home` | `cd /home/reza` | Ke direktori home |
| `profile` | `code ~/.zshrc` | Edit `.zshrc` di VS Code |
| `rprofile` | `source ~/.zshrc` | Reload konfigurasi shell |
| `ls` | `exa` / fallback `ls` | List file dengan warna & git status |
| `ll` | `exa -alF` / fallback `ls -alF` | List detail + icon + git status |
| `tree` | `exa --tree` / fallback `tree` | Tampilan pohon direktori |
| `mx` | `chmod a+x` | Tambah permission execute |
| `mod` | `chmod +x ./*` | Execute semua file di direktori |
| `code` | `code-server` | VS Code Server |

---

## 🛠️ Fungsi Custom

### `gupp` — Git push otomatis
```bash
gupp "pesan commit"
# → git add . && git commit -m "..." && git push -u origin <branch>
```

### `grel` — Buat GitHub Release otomatis
```bash
grel
# → zip ~/workspace → gh release create vX.X.X → upload
```
Auto-increment versi semver dari release terakhir.

### `mkdirg` — Buat direktori lalu masuk ke dalamnya
```bash
mkdirg nama-folder
```

### `cpg` — Copy file lalu pindah ke tujuan
```bash
cpg <source> <destination>
# File otomatis di-rename jika sudah ada di tujuan
```

### `mvg` — Move file lalu pindah ke tujuan
```bash
mvg <source> <destination>
```

### `cpwd` — Copy path direktori saat ini
```bash
cpwd          # → copy ke clipboard (xclip)
cpwd /tujuan  # → copy direktori ke path tujuan
```

### `rename` — Ganti nama file
```bash
rename nama-lama nama-baru
```

---

## ⌨️ Keybinding

| Shortcut | Aksi |
|---|---|
| `Ctrl + P` | Cari histori ke atas |
| `Ctrl + N` | Cari histori ke bawah |
| `Alt + W` | Hapus kata (kill-region) |
| `Esc Esc` | Tambah `sudo` di awal perintah |

---

## 🌐 Environment

| Variabel | Nilai |
|---|---|
| `GOROOT` | `/usr/local/go` |
| `GOPATH` | `$HOME/go` |
| `GOPROXY` | `https://proxy.golang.org,direct` |
| `GO111MODULE` | `on` |
| `NVM_DIR` | `$HOME/.nvm` |

---

## 📦 Dependensi Opsional

| Tool | Fungsi | Install |
|---|---|---|
| [`exa`](https://github.com/ogham/exa) | Pengganti `ls` dengan icon & git | `apt install exa` |
| [`fzf`](https://github.com/junegunn/fzf) | Fuzzy finder | `apt install fzf` |
| [`fd`](https://github.com/sharkdp/fd) | Pengganti `find` untuk fzf | `apt install fd-find` |
| [`gh`](https://cli.github.com/) | GitHub CLI untuk `grel` | `apt install gh` |
| [`xclip`](https://github.com/astrand/xclip) | Clipboard untuk `cpwd` | `apt install xclip` |
| [`btop`](https://github.com/aristocratos/btop) | Monitor sistem | `apt install btop` |

---

## 🤖 AI Config (opsional)

Jika menggunakan **pi** sebagai coding agent, edit konfigurasi model:

```bash
code ~/.pi/agent/models.json
```

---

## 📋 Verifikasi Instalasi

```bash
curl --version | head -n1
git --version
gh --version | head -n1
zsh --version
node -v && npm -v && nvm --version
```

---

## 📦 Releases

Lihat semua versi di halaman [Releases](https://github.com/rezapace/zsh-config/releases).

Untuk membuat release baru dari workspace lokal, gunakan fungsi `grel`:

```bash
grel
# ✅ v0.1.1 released with release-20260620120000.zip
```

---

## 📄 Lisensi

MIT © [rezapace](https://github.com/rezapace)

---

<div align="center">

⭐ Jika repo ini bermanfaat, berikan bintang!

[![GitHub Stars](https://img.shields.io/github/stars/rezapace/zsh-config?style=social)](https://github.com/rezapace/zsh-config)

</div>
