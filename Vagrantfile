Vagrant.configure("2") do |config|

  config.ssh.keep_alive = true
  config.vm.base_mac = nil
  config.vm.box_check_update = false
  config.vm.provision "file", source: "/home/kmdr7/.ssh/vagrant.pub", destination: "~/.ssh/vagrant.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/vagrant.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL

  config.vm.define "haproxy" do |cf|
    cf.vm.box = "centos/7"
    cf.vm.hostname = "haproxy"
    cf.vm.network "public_network", :adapter=>1, :bridge=>"enx0033918108a8", :mac => "080027c4b74f"
    cf.ssh.host = "192.168.100.41"
    cf.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "1028"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "kube-master-1" do |cf|
    cf.vm.box = "centos/7"
    cf.vm.hostname = "kube-master-1"
    cf.vm.network "public_network", :adapter=>1, :bridge=>"enx0033918108a8", :mac => "080027c4b71f"
    cf.ssh.host = "192.168.100.37"
    cf.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "4"]
      vb.customize ["modifyvm", :id, "--memory", "6096"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    end
  end

  config.vm.define "kube-node-1" do |cf|
    cf.vm.box = "centos/7"
    cf.vm.hostname = "kube-node-1"
    cf.vm.network "public_network", :adapter=>1, :bridge=>"enx0033918108a8", :mac => "080027c4b72f"
    cf.ssh.host = "192.168.100.38"
    cf.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    end
  end
end
