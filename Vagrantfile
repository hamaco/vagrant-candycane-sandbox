require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.host_name = "candycane-sandbox"
  config.vm.box = "base"
  config.vm.network :hostonly, "192.168.50.21"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[yum::epel]",
      "recipe[candycane-sandbox::default]",
      "recipe[candycane-sandbox::apache]",
      "recipe[candycane-sandbox::mysql]",
      "recipe[candycane-sandbox::php]",
      "recipe[candycane-sandbox::candycane]"
    ]
  end
end
