# Rocky Infraestructure Lab: 4 VMs with Rocky Linux 9 on Virtualbox
#
# - web01: Apache (reverse proxy) + Tomcat
# - db01: MariaDB
# - mon01: Checkmk, logs and backup
# - ctrl01: Ansible control node (runs the playbooks)
# 
# Total RAM = 6GB

# Box, net and machines
BOX = "bento/rockylinux-9"
NET = "192.168.56"
MACHINES = {
  "ctrl01" => {ip: "#{NET}.10", memory: 1024, cpus: 1},
  "db01" => {ip: "#{NET}.11", memory: 1024, cpus: 1},
  "web01" => {ip: "#{NET}.12", memory: 2048, cpus: 2},
  "mon01" => {ip: "#{NET}.13", memory: 2048, cpus: 2}
}

# Begin Vagrant configuration
Vagrant.configure("2") do |config|
  config.vm.box = BOX
  config.vm.box_check_update = false

# Configure each machine
  MACHINES.each do |name, options|
    config.vm.define name do |node|
      node.vm.hostname = name
      node.vm.network "private_network", ip: options[:ip]
      
      node.vm.provider "virtualbox" do |vb|  
        vb.name = "rocky-infraestructure-lab-#{name}"
        vb.memory = options[:memory]
        vb.cpus = options[:cpus]
        vb.linked_clone = true # Creates a base extra VM, but saves memory and speed

      end
    end
  end
end