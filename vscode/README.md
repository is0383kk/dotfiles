# VSCode 拡張機能の管理

このフォルダには VSCode の設定と拡張機能リストが含まれています。

## ファイル一覧

- `settings.json` - VSCode のユーザー設定
- `extensions.txt` - インストール済み拡張機能のリスト（1 行に 1 つの拡張機能 ID）

## エクスポート（現在の拡張機能をファイルに書き出す）

現在インストールされている拡張機能の一覧を `extensions.txt` に上書き出力します。

### PowerShell

```powershell
code --list-extensions | Out-File -FilePath .\extensions.txt -Encoding utf8
```

`code` コマンドが PATH に通っていない場合は、絶対パスを指定してください。

```powershell
& "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd" --list-extensions | Out-File -FilePath .\extensions.txt -Encoding utf8
```

### bash (Linux / macOS / Git Bash)

```bash
code --list-extensions > extensions.txt
```

## インポート（ファイルから拡張機能を一括インストールする）

`extensions.txt` に記載された拡張機能を順番にインストールします。

### PowerShell

```powershell
Get-Content .\extensions.txt | ForEach-Object { code --install-extension $_ }
```

`code` コマンドが PATH に通っていない場合は、絶対パスを指定してください。

```powershell
$code = "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd"
Get-Content .\extensions.txt | ForEach-Object { & $code --install-extension $_ }
```

### bash (Linux / macOS / Git Bash)

```bash
cat extensions.txt | xargs -L 1 code --install-extension
```

## 補足

- 既にインストール済みの拡張機能に対して `--install-extension` を実行した場合はスキップされます。
- 特定バージョンを指定したい場合は `publisher.extension@version` の形式で記載します。
