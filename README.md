# zsh-config

Konfigurasi Zsh personal yang ringan dan siap pakai, menggunakan **Zinit** sebagai plugin manager dan **Powerlevel10k** sebagai tema.

---

## Fitur

- **Plugin manager** — Zinit (auto-install saat pertama kali dijalankan)
- **Tema** — Powerlevel10k dengan instant prompt
- **Syntax highlighting** — `zsh-syntax-highlighting`
- **Autosuggestions** — `zsh-autosuggestions`
- **Autocomplete** — `zsh-completions` + `zsh-autocomplete`
- **Directory jump** — `z`, `fasd`, `autojump`
- **Warna ls** — `LS_COLORS` (trapd00r)
- **Fuzzy finder** — fzf + fzf-tab integration
- **OMZ Snippets** — `git`, `sudo`, `archlinux`, `command-not-found`
- **Go & NVM** — environment path sudah dikonfigurasi
- **Riwayat** — 10.000 baris, no duplicate, shared antar sesi

---

## Instalasi

```bash
# Clone repo
git clone https://github.com/rezapace/zsh-config.git ~/.zsh-config

# Backup .zshrc lama (opsional)
cp ~/.zshrc ~/.zshrc.bak

# Symlink atau copy ke .zshrc
cp ~/.zsh-config/.zsh ~/.zshrc

# Reload shell
source ~/.zshrc
```

> Zinit akan otomatis terinstall jika belum ada.

---

## Plugin yang Dimuat

| Plugin | Fungsi |
|---|---|
| `romkatv/powerlevel10k` | Tema prompt |
| `zsh-users/zsh-syntax-highlighting` | Highlighting perintah |
| `zsh-users/zsh-autosuggestions` | Saran perintah dari histori |
| `zsh-users/zsh-completions` | Tab completion tambahan |
| `marlonrichert/zsh-autocomplete` | Autocomplete real-time |
| `rupa/z` | Jump ke direktori sering dikunjungi |
| `clvv/fasd` | Akses cepat file & direktori |
| `wting/autojump` | Directory jumper |
| `trapd00r/LS_COLORS` | Warna output `ls` |

---

## Alias

| Alias | Perintah | Keterangan |
|---|---|---|
| `h` | `cd ~` | Ke home directory |
| `v` | `code .` | Buka VS Code di direktori saat ini |
| `c` | `clear` | Bersihkan terminal |
| `hapus` | `rm -rf` | Hapus paksa |
| `home` | `cd /home/reza` | Ke direktori home |
| `profile` | `code ~/.zshrc` | Edit `.zshrc` di VS Code |
| `rprofile` | `source ~/.zshrc` | Reload konfigurasi shell |
| `ls` | `exa` / fallback `ls` | List file dengan warna |
| `ll` | `exa -alF` / fallback `ls -alF` | List detail + icon + git status |
| `tree` | `exa --tree` / fallback `tree` | Tampilan pohon direktori |
| `mx` | `chmod a+x` | Tambah permission execute |
| `mod` | `chmod +x ./*` | Execute semua file di direktori |
| `code` | `code-server` | VS Code Server |

---

## Fungsi Custom

### `gupp` — Git push otomatis
```bash
gupp "pesan commit"
```
Melakukan `git add .`, `commit`, dan `push` ke branch aktif sekarang.

---

### `grel` — Buat GitHub Release otomatis
```bash
grel
```
Membuat zip dari `~/workspace`, lalu publish sebagai GitHub Release dengan auto-increment versi semver.

---

### `mkdirg` — Buat direktori lalu masuk ke dalamnya
```bash
mkdirg nama-folder
```

---

### `cpg` — Copy file lalu pindah ke tujuan
```bash
cpg <source> <destination>
```
File otomatis di-rename jika sudah ada di tujuan.

---

### `mvg` — Move file lalu pindah ke tujuan
```bash
mvg <source> <destination>
```

---

### `cpwd` — Copy path direktori saat ini
```bash
cpwd          # copy ke clipboard (xclip)
cpwd /tujuan  # copy direktori ke path tujuan
```

---

### `rename` — Ganti nama file
```bash
rename nama-lama nama-baru
```

---

## Keybinding

| Shortcut | Aksi |
|---|---|
| `Ctrl+P` | Cari histori ke atas |
| `Ctrl+N` | Cari histori ke bawah |
| `Alt+W` | Hapus kata (kill-region) |

---

## Environment

| Variabel | Nilai |
|---|---|
| `GOROOT` | `/usr/local/go` |
| `GOPATH` | `$HOME/go` |
| `GOPROXY` | `https://proxy.golang.org,direct` |
| `NVM_DIR` | `$HOME/.nvm` |

---

## Dependensi (opsional tapi direkomendasikan)

- [`exa`](https://github.com/ogham/exa) — pengganti `ls`
- [`fzf`](https://github.com/junegunn/fzf) — fuzzy finder
- [`fd`](https://github.com/sharkdp/fd) — pengganti `find` untuk fzf
- [`gh`](https://cli.github.com/) — GitHub CLI (untuk `grel`)
- [`xclip`](https://github.com/astrand/xclip) — clipboard (untuk `cpwd`)

---

## Lisensi

MIT
