# _*_ mode: ruby _*_
# vi: set ft=ruby :

machines = {
  "master" => {"memory" => "512", "cpu" => "1", "ip" => "100", "image" => "generic/alpine316"},
  "node01" => {"memory" => "512", "cpu" => "1", "ip" => "101", "image" => "generic/alpine316"},
  "node02" => {"memory" => "512", "cpu" => "1", "ip" => "102", "image" => "generic/alpine316"},
  "node03" => {"memory" => "512", "cpu" => "1", "ip" => "103", "image" => "generic/alpine316"},
  "node04" => {"memory" => "512", "cpu" => "1", "ip" => "104", "image" => "generic/alpine316"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "10.10.10.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
      machine.vm.synced_folder ".", "/vagrant"
        
      end
      machine.vm.provision "shell", path: "docker.sh", reset: true
      
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end

    end
  end
end