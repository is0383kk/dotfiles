<table>
	<thead>
    	<tr>
      		<th style="text-align:center">English</th>
      		<th style="text-align:center"><a href="./README_ja.md">日本語</a></th>
    	</tr>
  	</thead>
</table>

# dotfiles

A dotfiles repository containing is0383kk's personal configuration files.  
Deployment assumes the use of [chezmoi](https://www.chezmoi.io/).  
*Note: is0383kk is a Windows user. **Some configuration files are intended to be placed on Windows.***

## Directory Structure

| Path | Destination | Purpose |
| --- | --- | --- |
| `dot_claude/` | `~/.claude/` | Claude Code (`CLAUDE.md`, `settings.json`) |
| `dot_codex/` | `~/.codex/` | Codex CLI (`AGENTS.md`, `config.toml`) |
| `dot_copilot/` | `~/.copilot/` | GitHub Copilot CLI (`settings.json`) |
| `dot_agents/` | `~/.agents/` | Shared notification hooks for the 3 agents (`hooks/*.ps1`, `hooks/sounds/*.wav`) |
| `dot_config/nvim/` | `~/.config/nvim/` | Neovim (`init.lua`) |
| `dot_config/psmux/` | `~/.config/psmux/` | psmux (`psmux.conf`) |
| `vscode-config/` | Varies by OS (see table below) | VSCode (`settings.json`, `keybindings.json`, `extensions.txt`). **Not managed by chezmoi** |

The `dot_*` prefix follows chezmoi's source naming convention and is replaced with `.` upon deployment.  
Directories without the `dot_` prefix, such as `vscode-config/`, are not managed by chezmoi and must be placed manually by the user.

## Setup

```powershell
chezmoi init is0383kk

# Check diff (no actual apply)
chezmoi diff

# Dry run
chezmoi apply --dry-run --verbose

# Apply
chezmoi apply
```

## Additional Tool-Specific Configuration

### Neovim (Windows only)

Since Neovim and psmux respect `$XDG_CONFIG_HOME`,  
adding the following line to your PowerShell profile (`$PROFILE`) on Windows allows them to reference the same `~/.config/<tool>/` path as on Linux/macOS.

```powershell
$env:XDG_CONFIG_HOME = "$env:USERPROFILE\.config"
```

*Without this setting, Neovim defaults to referencing `~/AppData/Local/nvim/`, which will not match the chezmoi deployment destination of `dot_config/nvim/` (`~/.config/nvim/`).*

### VSCode (Manual Placement)

Copy (or symlink) the contents of `vscode-config/` to the User configuration directory for your OS.

| OS | Destination |
| --- | --- |
| Windows | `%APPDATA%\Code\User\` |
| macOS | `~/Library/Application Support/Code/User/` |
| Linux | `~/.config/Code/User/` |

For instructions on bulk-installing extensions, see [`vscode-config/README.md`](./vscode-config/README.md).

### Hooks (Claude Code / Codex CLI / GitHub Copilot CLI)

The notification hooks require the [BurntToast](https://github.com/Windos/BurntToast) PowerShell module.  
Launch PowerShell as administrator and install BurntToast with the following command.

```powershell
Install-Module -Name BurntToast -Force
```
