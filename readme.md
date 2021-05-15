# Laravel localhost development for Ubuntu 20.04

Laravel localhost development for Ubuntu allow you to install a variety of applications and dependencies that you may necessary to start Laravel development

### Dependencies

* git
* curl
* wget
* zip
* unzip
* php
* composer
* laravel
* valet
* node
* npm
* npx
* yarn
* nginx
* redis
* supervisor
* zsh

### Applications

* sublime-text
* sublime-merge

## Initial settings

Change username on `inventory/laravel.yml` vars with your username
```bash
vars:
  username: 'ubuntu'
```

Install `ansible` in your system
```bash
sudo apt -y install ansible
```

## Usage and information

Install lemp server in your local ubuntu server 20.04
```bash
ansible-playbook -i inventory/laravel.yml playbooks/laravel.yml -K
```

MySQL Server Secury installation
```bash
sudo mysql_secure_installation
# first no
# remaining yes
```

Create new database and credentials
```bash
sudo mysql;
CREATE DATABASE laravel DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'laravel'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL ON laravel.* TO 'laravel'@'localhost';
FLUSH PRIVILEGES;
```
