-- ~/.config/nvim/init.lua
-- Windowsなら通常: ~/AppData/Local/nvim/init.lua

vim.g.mapleader = " "        -- <Leader>キーをスペースに設定
vim.g.maplocalleader = "\\"  -- <LocalLeader>キーをバックスラッシュに設定

local opt = vim.opt

-- 表示
opt.number = true          -- 行番号を表示
opt.relativenumber = true  -- カーソル行からの相対行番号を表示
opt.signcolumn = "yes"     -- サイン列を常に表示（差分やLSPの記号で表示幅がぶれないようにする）
opt.cursorline = true      -- カーソルのある行を強調表示
opt.termguicolors = true   -- 24bitトゥルーカラーを有効化
opt.wrap = false           -- 長い行を折り返さず1行で表示
opt.scrolloff = 8          -- カーソル上下に最低8行のマージンを確保
opt.sidescrolloff = 8      -- カーソル左右に最低8桁のマージンを確保

-- インデント
opt.expandtab = true   -- タブをスペースに展開
opt.shiftwidth = 2     -- 自動インデントの幅をスペース2つに設定
opt.tabstop = 2        -- タブ文字の表示幅をスペース2つに設定
opt.smartindent = true -- 構文を考慮した自動インデントを有効化

-- 検索
opt.ignorecase = true -- 検索時に大文字小文字を区別しない
opt.smartcase = true  -- 検索語に大文字が含まれる場合のみ大文字小文字を区別
opt.hlsearch = true   -- 検索結果をハイライト表示
opt.incsearch = true  -- 入力中に逐次検索（インクリメンタルサーチ）

-- 操作感
opt.clipboard = "unnamedplus" -- システムクリップボードと連携
opt.mouse = "a"               -- すべてのモードでマウス操作を有効化
opt.splitright = true         -- ウィンドウを縦分割したとき新規ウィンドウを右に開く
opt.splitbelow = true         -- ウィンドウを横分割したとき新規ウィンドウを下に開く
opt.updatetime = 250          -- スワップ書き込みやCursorHold発火までの待機時間（ms）
opt.timeoutlen = 400          -- キーマッピングの入力待ち時間（ms）
opt.undofile = true           -- アンドゥ履歴をファイルに保存し再起動後も復元

-- psmux/tmux環境でタイトルを見やすくする
opt.title = true                -- 端末のタイトルを書き換える機能を有効化
opt.titlestring = "nvim: %t"    -- タイトルに「nvim: ファイル名」を表示
