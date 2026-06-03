<table>
	<thead>
    	<tr>
      		<th style="text-align:center"><a href="./README.md">English</a></th>
      		<th style="text-align:center">日本語</th>
    	</tr>
  	</thead>
</table>

# dotfiles

is0383kk の個人用設定ファイルをまとめた dotfiles リポジトリです。  
配置は [chezmoi](https://www.chezmoi.io/) を利用することを想定しています。  
*is0383kk は Windows ユーザです。**一部設定ファイルは Windows 上に配置することを前提**とします。*

## ディレクトリ構成

| パス | 配置先 | 用途 |
| --- | --- | --- |
| `dot_claude/` | `~/.claude/` | Claude Code (`CLAUDE.md`, `settings.json`) |
| `dot_codex/` | `~/.codex/` | Codex CLI (`AGENTS.md`, `config.toml`) |
| `dot_copilot/` | `~/.copilot/` | GitHub Copilot CLI (`settings.json`) |
| `dot_agents/` | `~/.agents/` | 3 エージェント共通の通知フック (`hooks/*.ps1`, `hooks/sounds/*.wav`) |
| `dot_config/nvim/` | `~/.config/nvim/` | Neovim (`init.lua`) |
| `dot_config/psmux/` | `~/.config/psmux/` | psmux (`psmux.conf`) |
| `vscode-config/` | OS により異なる (下表参照) | VSCode (`settings.json`, `keybindings.json`, `extensions.txt`)。**chezmoi 管理対象外** |

`dot_*` プレフィックスは chezmoi のソース命名規則に従っており、展開時に `.` に置換されます。  
`vscode-config/` のように `dot_` プレフィックスを持たないディレクトリは chezmoi の管理対象外で、ユーザーが手動で配置します。

## セットアップ

```powershell
chezmoi init is0383kk

# 差分確認 (実適用なし)
chezmoi diff

# ドライラン
chezmoi apply --dry-run --verbose

# 実適用
chezmoi apply
```

## ツール別追加設定

### Neovim (Windows のみ)

Neovim と psmux は `$XDG_CONFIG_HOME` を尊重するため、  
Windows でも下記を PowerShell プロファイル (`$PROFILE`) に追加することで Linux/macOS と同じ `~/.config/<tool>/` を参照させられます。

```powershell
$env:XDG_CONFIG_HOME = "$env:USERPROFILE\.config"
```

※これを設定しない場合、Neovim はデフォルトで `~/AppData/Local/nvim/` を参照するため `dot_config/nvim/` の chezmoi 展開先 (`~/.config/nvim/`) と一致しなくなります。

### VSCode (手動配置)

`vscode-config/` の中身を OS ごとの User 設定ディレクトリへコピー (またはシンボリックリンク) します。

| OS | 配置先 |
| --- | --- |
| Windows | `%APPDATA%\Code\User\` |
| macOS | `~/Library/Application Support/Code/User/` |
| Linux | `~/.config/Code/User/` |

拡張機能の一括インストール手順は [`vscode-config/README.md`](./vscode-config/README.md) を参照してください。

### Hooks (Claude Code / Codex CLI / GitHub Copilot CLI)

通知フックのため、PowerShell に [BurntToast](https://github.com/Windos/BurntToast) モジュールをインストールする必要があります。  
管理者権限で PowerShellを起動し、下記コマンドで BurntToast を導入してください。

```powershell
Install-Module -Name BurntToast -Force
```
