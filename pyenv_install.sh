#!/bin/bash
# pyenv + 最新 Python 自動安裝腳本 (Ubuntu/Docker Ubuntu)

set -e

echo "🔄 更新套件..."
sudo apt update

echo "📦 安裝必要套件..."
sudo apt install -y \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev \
    libffi-dev liblzma-dev python3-openssl git

echo "⬇️ 安裝 pyenv..."
curl https://pyenv.run | bash

echo "⚙️ 設定環境變數到 ~/.bashrc ..."
if ! grep -q 'pyenv init' ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc

# >>> pyenv setup >>>
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# <<< pyenv setup <<<
EOF
fi

# 套用設定
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

echo "✅ pyenv 安裝完成，版本：$(pyenv --version)"

echo "🔎 找最新穩定版 Python..."
LATEST=$(pyenv install --list | grep -E "^\s*3\.[0-9]+\.[0-9]+$" | tail -1 | tr -d ' ')

echo "⬇️ 安裝 Python $LATEST ..."
pyenv install -s "$LATEST"

echo "🌍 設定全域 Python 版本為 $LATEST ..."
pyenv global "$LATEST"

echo "🐍 Python 版本確認："
python --version
pip --version

echo "🎉 完成！pyenv 已安裝，Python $LATEST 已設定為全域版本。"

