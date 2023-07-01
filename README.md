# Ubuntu 簡單設置指南

這份指南提供了一些在Ubuntu上進行基本設置的步驟。這些步驟包括安裝常用軟體、更新系統和進行基本配置。

## 目錄

- [安裝常用軟體](#安裝常用軟體)
- [更新系統](#更新系統)
- [基本配置](#基本配置)

## 安裝常用軟體

以下是安裝一些常用軟體的步驟：

1. 安裝Git：

   ```bash
   sudo apt-get update
   sudo apt-get install -y git
   ```

2. 安裝Docker：

   ```bash
   sudo apt-get remove docker docker-engine docker.io containerd runc
   sudo apt-get update
   sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io
   sudo usermod -aG docker $USER
   ```

3. 安裝Python 3：

   ```bash
   sudo apt-get install -y python3
   ```

4. 安裝Vim：

   ```bash
   sudo apt-get install -y vim
   ```

5. 安裝FileZilla：

   ```bash
   sudo apt-get install -y filezilla
   ```

## 更新系統

在開始使用Ubuntu之前，建議確保系統是最新的。可以運行以下命令進行系統更新：

```bash
sudo apt-get update
sudo apt-get upgrade -y
```

## 基本配置

這裡列出了一些基本配置建議：

1. 設置時區：

   ```bash
   sudo dpkg-reconfigure tzdata
   ```

   依照提示選擇適合你所在地區的時區。

2. 設置系統語言：

   ```bash
   sudo dpkg-reconfigure locales
   ```

   依照提示選擇適合你的語言設置。

3. 增加額外的軟體庫：

   根據需要，你可以添加額外的軟體庫以獲取更多軟體套件。

4. 安全性配置：

   - 使用強密碼：

建議設置強密碼以增強系統安全性。
   - 開啟防火牆：使用 `ufw` 或其他防火牆工具設置防火牆規則。

以上只是一些基本的配置建議，根據個人需求可能會有所不同。

這只是一個簡單的Ubuntu設置指南範例，你可以根據需要進行擴充和自定義。希望對你有所幫助！
