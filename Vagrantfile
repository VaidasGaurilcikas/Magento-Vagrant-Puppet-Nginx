# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.host_name = "box.localhost"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
	#v.customize ["modifyvm", :id, "--cpuexecutioncap", "99"]
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

  config.vm.network "private_network", ip: "192.168.56.200"

  config.vm.synced_folder "web-root/", "/var/www"

  config.vm.provision :shell, :inline => "sudo apt-get update && sudo apt-get install puppet -y"
#  config.vm.provision :shell, :inline => "sudo apt-get install puppet -y"

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "thebox/puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path    = "thebox/puppet/modules"
     #puppet.options        = "--verbose --debug"
  end

end
