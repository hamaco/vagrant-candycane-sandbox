# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "candycane-sandbox"
  config.vm.network :private_network, ip: "192.168.50.21"

  config.vm.box = "base"
  # config.vm.box = "CentOS-6.4-x86_64"
  # config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef-repo/cookbooks", "chef-repo/site-cookbooks"]

    chef.add_recipe "recipe[yum::epel]"
    chef.add_recipe "recipe[candycane::default]"
    chef.add_recipe "recipe[candycane::apache]"
    chef.add_recipe "recipe[candycane::mysql]"
    chef.add_recipe "recipe[candycane::php]"
    chef.add_recipe "recipe[candycane::candycane]"
  end
end
