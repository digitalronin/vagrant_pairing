Vagrant::Config.run do |config|
  config.vm.boot_mode = :gui
  config.vm.box = "precise64"
  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "site.pp"
  end
end
