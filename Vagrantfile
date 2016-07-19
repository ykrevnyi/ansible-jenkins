# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  # create jenkins node
  config.vm.define :jenkins do |jenkins_config|
      jenkins_config.vm.box = "ubuntu/trusty64"
      jenkins_config.vm.hostname = "jenkins.dev"
      jenkins_config.vm.network "private_network", type: "dhcp"
      jenkins_config.ssh.forward_agent = true

      jenkins_config.landrush.enabled = true
      jenkins_config.landrush.tld = "dev"
      jenkins_config.landrush.guest_redirect_dns = false

      jenkins_config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
      end

    jenkins_config.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/site.yml"
      ansible.inventory_path = "ansible/inventory.ini"
      ansible.limit = "all"
    end
  end

end
