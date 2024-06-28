.DEFAULT_GOAL = help

help: # Show a list of commands available.
	@echo "List of commands to work with Laravel environment."
	@echo "usage: make <command>\n"
	@echo "Commands:\n"
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

basic: # Basic setup of laravel development. [Initial setup and Ubuntu/Debian Based]
	@ansible-playbook -i playbooks/inventory.yml playbooks/basic.yml --extra-vars ansible_user=$$(id -nu) -K
	@gnome-session-quit --no-prompt

wsl: # Setup of laravel development on WSL. [Initial setup and Ubuntu/Debian Based]
	@ansible-playbook -i playbooks/inventory.yml playbooks/wsl.yml --extra-vars ansible_user=$$(id -nu) -K

setup: # Setup of laravel development. [Initial setup and Ubuntu/Debian Based]
	@ansible-playbook -i playbooks/inventory.yml playbooks/setup.yml --extra-vars ansible_user=$$(id -nu) -K
	@gnome-session-quit --no-prompt

up: # Create vagrant ubuntu virtual machine for testing.
	@vagrant up

provision: # Provision vagrant ubuntu virtual machine.
	@vagrant provision

ssh: # SSH into vagrant ubuntu virtual machine.
	@vagrant ssh

destroy: # Destroy vagrant ubuntu virtual machine.
	@vagrant destroy -f
