
Vagrant.configure("2") do |config|
  config.vm.define "laravel" do |node|
    config.env.enable
    node.vm.box = ENV["BOX"]
    node.vm.hostname = ENV["HOSTNAME"]

    node.vm.network ENV["NETWORK"],
      ip: ENV["IP_ADDRESS"],
      bridge: ENV["BRIDGE"],
      gateway: ENV["GATEWAY"],
      netmask: ENV["NETMASK"]

    node.vm.provider "virtualbox" do |vm|
      vm.cpus = ENV["CPUS"]
      vm.memory = ENV["MEMORY"]
      vm.name = ENV["NAME"]
    end

    node.vm.provision "ansible" do |ansible|
      ansible.playbook = ENV["PLAYBOOK"]
      ansible.compatibility_mode = "1.8"
    end
  end
end
