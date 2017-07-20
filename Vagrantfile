# -*- mode: ruby -*-
# # vi: set ft=ruby :

# required vagrant version
Vagrant.require_version ">= 1.9.2"

# api version to be used
VAGRANTFILE_API_VERSION = "2"

# required plugins
require 'vagrant-vbguest'

# define virtual machine hardware
$vm_cpus = (ENV['VM_CPUS'] || 1).to_i
$vm_memory = (ENV['VM_MEMORY'] || 1024).to_i

# should the vm use a proxy?
if $vm_proxy_enabled = (ENV['VM_PROXY']).to_s != "" ? true : false == true
  require 'vagrant-proxyconf'

  # this is the proxy address that will be used by the operating system
  $vm_proxy_address = (ENV['VM_PROXY']).to_s
end

# configure instances
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # ssh configuration
  config.ssh.insert_key = false
  config.ssh.username = 'vagrant'

  # disable update of guest additions
  config.vbguest.auto_update = false
  config.vbguest.no_install = true
  config.vbguest.no_remote = true

  # when plugin proxyconf is installed, use it
  if $vm_proxy_enabled == true
      config.proxy.enabled = true
      config.proxy.http = $vm_proxy_address
      config.proxy.https = $vm_proxy_address
  end

  # define hostname
  config.vm.hostname = 'wireshark'
  # define image to be used
  config.vm.box = "bento/centos-7.2"
  # enable synced folder
  config.vm.synced_folder ".", "/vagrant"

  # virtual box settings
  config.vm.provider :virtualbox do |vbox, override|
    vbox.cpus = 6
    vbox.memory = 8192
    vbox.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end

  # prepare build environment
  config.vm.provision :shell,
    privileged: true,
    inline: "/vagrant/wireshark-prepare.sh"

  # start build
  config.vm.provision :shell,
    privileged: false,
    inline: "/vagrant/wireshark-build.sh"

  # copy result
  config.vm.provision :shell,
    privileged: false,
    inline: "rm -rf /vagrant/result; mkdir -p /vagrant/result"
  config.vm.provision :shell,
    privileged: false,
    inline: "cp /tmp/wireshark/packaging/rpm/RPMS/x86_64/*.rpm /vagrant/result"
  config.vm.provision :shell,
    privileged: false,
    inline: "cp /tmp/wireshark/packaging/rpm/SRPMS/*.rpm /vagrant/result"

end
