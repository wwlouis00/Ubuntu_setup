#!/bin/bash
set -e  # 發生錯誤即停止執行
set -o pipefail

# ===============================
#  一鍵開發環境安裝腳本 V2
# ===============================

# ---- 配色設定 ----
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

log() {
  echo -e "${GREEN}[INFO]${RESET} $1"
}

warn() {
  echo -e "${YELLOW}[WARN]${RESET} $1"
}

error_exit() {
  echo -e "${RED}[ERROR]${RESET} $1"
  exit 1
}

# ---- 基本更新 ----
log "Updating system..."
sudo apt-get update -y

# ---- Git ----
log "Installing Git..."
sudo apt-get install -y git

# ---- Docker ----
log "Installing Docker..."
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
log "Docker installed successfully."

# ---- Python & Pyenv ----
log "Installing Python3 and Pyenv..."
sudo apt-get install -y python3 python3-pip
chmod +x ./pyenv_install.sh || true
if [ -f "./install_pyenv_with_python.sh" ]; then
  source ./install_pyenv_with_python.sh
else
  warn "install_pyenv_with_python.sh not found, skipping pyenv installation."
fi

# ---- 開發與系統工具 ----
log "Installing development tools..."
sudo apt-get install -y vim filezilla openssh-server qttools5-dev-tools \
  figlet lolcat fcitx fcitx-chewing cmatrix ranger htop tmux

# ---- SSH ----
log "Enabling SSH service..."
sudo systemctl enable ssh
sudo systemctl start ssh

# ---- Oh My Zsh ----
log "Installing Oh My Zsh..."
sudo apt-get install -y zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
fi
chsh -s "$(which zsh)"

# ---- 完成訊息 ----
echo -e "\n${GREEN}============================================"
echo -e " ✅  All installations completed successfully!"
echo -e "============================================${RESET}"
