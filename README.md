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

Change username on `inventory.yml` vars with your username
```bash
username: 'ubuntu'
```

Install `ansible` in your system
```bash
sudo apt -y install ansible
```

## Usage and information

Install laravel in your local ubuntu desktop 20.04
```bash
ansible-playbook -i inventory.yml laravel.yml
```
> Add flag `-K` in case user has credentials

Logoff to shell complete the change to `zsh` shell
```bash
gnome-session-quit --no-prompt
```

### Tags

Using tags helps to define which roles will be selected or skipped

Run only tags with tags `terminal` and `zsh`
```bash
ansible-playbook -i inventory.yml laravel.yml --tags "terminal,zsh"
```

Run all tasks except those with the tags `valet` and `supervisor`
```bash
ansible-playbook -i inventory.yml laravel.yml --skip-tags "valet,supervisor"
```

### Aliases
You may use the aliases `www`, `phpunit`, and `artisan`

* www - `cd ~/www`
* phpunit - `php ./vendor/phpunit/phpunit/phpunit`
* artisan - `php artisan`

### Timezone on dual boot

Linux assumes that the time is stored in UTC and Windows uses the local timezone, because the timezone is stored in the BIOS settings happens that when the computer boots on windows or linux it messes up the timezone settings

Enable local RTC
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```

Check current settings
```bash
timedatectl
```
> If RTC is enable it's setup
