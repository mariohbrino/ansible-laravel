
Vagrant.configure('2') do |config|
  config.vm.define 'laravel' do |node|
    node.vm.box = 'bento/ubuntu-22.04'
    node.vm.hostname = 'laravel'

    node.vm.network 'public_network',
      ip: '10.25.10.99',
      bridge: 'eno1',
      gateway: '10.25.10.1',
      netmask: '255.255.255.0'

    node.vm.provider 'virtualbox' do |vm|
      vm.cpus = '2'
      vm.memory = '4096'
      vm.name = 'laravel'
    end

    node.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'playbooks/development.yml'
      ansible.compatibility_mode = '1.8'
    end
  end
end
