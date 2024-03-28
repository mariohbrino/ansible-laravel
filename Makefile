.DEFAULT_GOAL = basic

basic: # Basic setup of laravel development. [Initial setup and Ubuntu/Debian Based]
	@ansible-playbook -i inventory.yml basic.yml --extra-vars username=$$(id -nu) -K
	@gnome-session-quit --no-prompt

setup: # Setup of laravel development. [Initial setup and Ubuntu/Debian Based]
	@ansible-playbook -i inventory.yml setup.yml --extra-vars username=$$(id -nu) -K
	@gnome-session-quit --no-prompt
