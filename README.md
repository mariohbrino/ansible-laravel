# Ansible Playbook for Laravel on Ubuntu 22.04

Ansible Playbook for Laravel on Ubuntu to install a couple applications and dependencies that you may need to start development with Laravel.

## Initial settings

Install ansible and make in your system, then run the make command to set up the machine.
```bash
sudo apt -y install ansible make    # install necessary dependencies.
make [setup | basic | wsl]          # Provision laravel development environemnt.
make up                             # Create vagrant ubuntu virtual machine for testing.
make provision                      # Provision vagrant ubuntu virtual machine.
make ssh                            # SSH into vagrant ubuntu virtual machine.
make destroy                        # Destroy vagrant ubuntu virtual machine.
```

> To work with vagrant make sure to install `vagrant` and `virtualbox`.

### Configure VSCode

1. Open settings on vscode (ctrl+,), then add MesloLGS NF to the `editor font family` list and save.
2. Open settings on vscode (ctrl+,), then search for `terminal integrated font family` and change to MesloLGS NF and save.

### Working with WSL

To install and uninstall WSL use the commands below. Open PowerShell with elevated credentials.
```powershell
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --install
wsl --update
wsl --set-default-version 2
```

To install a wsl distribution use the commands below. Open PowerShell with elevated credentials.
```powershell
wsl -l -o                           # List all wsl distro availables.
wsl --install ubuntu-22.04          # Install wsl ubuntu 22.04.
wsl --unregister ubuntu-22.04       # Uninstall wsl ubuntu 22.04.
```

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
