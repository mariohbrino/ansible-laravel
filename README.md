# Laravel local development for Ubuntu 20.04

Laravel local development for Ubuntu is an ansible playbook that allows you to install a variety of applications and dependencies that you may need to start development with Laravel

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
* oh-my-zsh

### Applications

* sublime-text
* sublime-merge
* vscode

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

Install laravel in your local ubuntu desktop 20.04
```bash
ansible-playbook -i inventory/laravel.yml playbooks/laravel.yml -K
```

Change to `zsh` shell
```bash
chsh -s /usr/bin/zsh && gnome-session-quit --no-prompt
```

MySQL Server Secury installation
```bash
sudo mysql_secure_installation
# first no
# remaining yes
```

### Tags

Using tags helps to define which roles will be selected or skipped

Run only tags with tags `terminal` and `zsh`
```bash
ansible-playbook -i inventory/laravel.yml playbooks/laravel.yml -K --tags "terminal,zsh"
```

Run all tasks except those with the tags `valet` and `supervisor`
```bash
ansible-playbook -i inventory/laravel.yml playbooks/laravel.yml -K --skip-tags "valet,supervisor"
```

### Aliases
You may use the aliases `www`, `phpunit`, and `artisan`

Create `www` folder in your home profile
```bash
mkdir ~/www
```

* www - `cd ~/www`
* phpunit - `php ./vendor/phpunit/phpunit/phpunit`
* artisan - `php artisan`
