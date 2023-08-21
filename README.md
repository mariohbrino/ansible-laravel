# Laravel local development for Ubuntu 22.04

Laravel local development for Ubuntu is an ansible playbook that allows you to install a variety of applications and dependencies that you may need to start development with Laravel.

## Initial settings

```bash
# Install ansible in your system.
sudo apt -y install ansible

# Define username on inventory.yml vars with your username.
username: 'ubuntu'

# Define ansible connection on inventory.yml local or ssh.
ansible_connection: '<connection>'
```

### Local connection

For local connection make sure to change the connection and remove the attributes below from inventory.yml.

```bash
# define the andible connection on inventory.yml.
ansible_connection: local

# remove these variables from inventory.yml.
ansible_ssh_pipelining
ansible_ssh_private_key_file
```

### SSH connection

Configure the ssh config file on the deploying playbook machine when using ssh connection.

```bash
# /home/<username>/.ssh/config
Host *
  IdentitiesOnly=yes

Host <machine-name>
  HostName <ip-address>
  User <username>
  Port 22
  ForwardAgent yes
  IdentityFile ~/.ssh/ssh-key
```
> Generate a ssh-key and then copy the public key to your remote machine [here](https://www.ssh.com/academy/ssh/copy-id).

## Usage and information

To install all applications and dependencies you can specify the `inventory` and `playbook`, then you should logoff and login again after completed to apply all changes.

```bash
# Install laravel in your local ubuntu desktop 22.04.
ansible-playbook -i inventory.yml laravel.yml -K

# Logoff to shell complete the change to zsh shell.
gnome-session-quit --no-prompt
```

### Tags

Using tags helps to define which roles will be selected or skipped.
```bash
# Run only tags with tags terminal and zsh.
ansible-playbook -i inventory.yml laravel.yml --tags "terminal,zsh"

# Run all tasks except those with the tags valet and supervisor.
ansible-playbook -i inventory.yml laravel.yml --skip-tags "valet,supervisor"
```

### Aliases
You may use the aliases `www`, `phpunit`, and `artisan`.

* www - `cd ~/www`
* phpunit - `php ./vendor/phpunit/phpunit/phpunit`
* artisan - `php artisan`

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

### Timezone on dual boot

Linux assumes that the time is stored in UTC and Windows uses the local timezone, because the timezone is stored in the BIOS settings happens that when the computer boots on windows or linux it messes up the timezone settings.
```bash
# Enable local RTC.
timedatectl set-local-rtc 1 --adjust-system-clock
# Check current settings.
timedatectl
```
> If RTC is enable it's setup
