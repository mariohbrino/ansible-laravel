# Laravel local development for Ubuntu 22.04

Laravel local development for Ubuntu is an ansible playbook that allows you to install a variety of applications and dependencies that you may need to start development with Laravel.

## Initial settings

Install ansible and make in your system, then run the make command to set up the machine.
```bash
sudo apt -y install ansible make    # install necessary dependencies.
make setup                          # run playbook setup on local computer, may use make basic to configure without some applications.
```

### Configure VSCode

1. Open settings on vscode (ctrl+,), then add MesloLGS NF to the `editor font family` list and save.
2. Open settings on vscode (ctrl+,), then search for `terminal integrated font family` and change to MesloLGS NF and save.

## Usage and information

### Aliases
You may use the aliases `www`, `phpunit`, and `artisan`.

* www - `cd ~/www`
* phpunit - `php ./vendor/phpunit/phpunit/phpunit`
* artisan - `php artisan`

### Timezone on dual boot

Linux assumes that the time is stored in UTC and Windows uses the local timezone, because the timezone is stored in the BIOS settings happens that when the computer boots on windows or linux it messes up the timezone settings.
```bash
# Enable local RTC.
timedatectl set-local-rtc 1 --adjust-system-clock
# Check current settings.
timedatectl
```
> If RTC is enable it's setup
