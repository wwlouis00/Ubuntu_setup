# Ubuntu Simple Setup Guide

This guide provides steps for basic setup on Ubuntu. These steps include installing commonly used software, updating the system, and performing basic configurations.

## Install Common Software

Here are the steps to install some commonly used software:

1. Install Git：

   ```bash
   sudo apt-get update
   sudo apt-get install -y git
   ```

2. Install Docker：

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

3. Install Python3：

   ```bash
   sudo apt-get install -y python3
   ```

4. Install Vim：

   ```bash
   sudo apt-get install -y vim
   ```

5. Install FileZilla：

   ```bash
   sudo apt-get install -y filezilla
   ```

## Update system

Before starting to use Ubuntu, it is advisable to ensure that the system is up to date. You can run the following command to update the system:

```bash
sudo apt-get update
sudo apt-get upgrade -y
```

## Basic configuration.

Here are some basic configuration recommendations:

1. Set the time zone:

   ```bash
   sudo dpkg-reconfigure tzdata
   ```

   Choose the time zone that corresponds to your region, following the prompts.

2. Set the system language:

   ```bash
   sudo dpkg-reconfigure locales
   ```

   Select the language settings that are appropriate for you, following the prompts.

3. Add additional software repositories:

   As needed, you can add additional repositories to obtain more software packages.

4. Security Configuration:

   Use strong passwords
