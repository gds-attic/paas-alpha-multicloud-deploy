# -*- mode: ruby -*-
# vi: set ft=ruby :

MEMORY_DEFAULT = 384

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "jenkins"

  config.vm.provider :virtualbox do |v|
    v.memory = MEMORY_DEFAULT
  end

  config.vm.provider :vmware_fusion do |v|
    v.vmx["memsize"] = MEMORY_DEFAULT
  end

  config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true

  config.vm.provision :shell, inline: "apt-get purge -qq -y --auto-remove chef puppet"
  config.vm.provision :ansible do |ansible|
    ansible.groups = { "jenkins-master" => ["default"] }
    ansible.playbook = "site.yml"
    ansible.ask_vault_pass = true
  end
end
