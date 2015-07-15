# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "geerlingguy/centos7"
#  config.vm.box = "magmadigital/centos-7.0"
  config.vm.box_download_insecure = true
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.define :beacondev, primary: true do |beacondev|
    beacondev.vm.network :forwarded_port, host: 8080, guest: 8080
    beacondev.vm.network :forwarded_port, host: 5000, guest: 5000
    beacondev.vm.network :forwarded_port, host: 2201, guest: 22, id: "ssh", auto_correct: true
    beacondev.vm.network "private_network", ip: "192.168.50.10"
    beacondev.vm.provision "shell", path: "bootstrap.sh"
    beacondev.vm.provision :shell, inline: 'ansible-playbook /vagrant/local.yml -c local -vvvvvvvv'
    beacondev.vm.hostname = "beacondev"
  end
#  config.vm.define :prod do |prod|
#    prod.vm.network :forwarded_port, host: 2202, guest: 22, id: "ssh", auto_correct: true
#    prod.vm.network :forwarded_port, host: 9001, guest: 9001
#    prod.vm.network "private_network", ip: "192.168.50.11"
#    prod.vm.hostname = "prod"
#  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
