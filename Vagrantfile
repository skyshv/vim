# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  $script=<<SCRIPT
sudo sed -i '/kaiyun.chen@emc.com/d' /home/vagrant/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCi+0Yx/ucqITEmdeF6nDgx0u57MxOMY644SUTf3wqTTPJaTI7ljeQpkjx8MbtbPrkLdf/1kXfsJaMxnmXApV5qylghmBcrS8uKGRrMGv976IM4Hln6/KkI1qxo+1UPP2OGTgCOeRsmdNHsSW8s1Hcq2m/LTSy71uIK4CHNbGwvcUztKqugkUZycJztIkm/aGgd7fDN0AWOs+gg6j6wHmXoQxU05bb0xpV3BcbsJNRYLPDutcWiDEr2pjUsTwkB3RLeVXXsrxP33VnO5qlLevl8e2ryphpFpqXFgA7eX4G22C59qFtVeJopb1/qs0MXlY8t/2gzHc6FMRCjrY8ArsCb kaiyun.chen@emc.com" >> /home/vagrant/.ssh/authorized_keys
sudo systemctl restart network.service
sudo yum install -y wget
sudo yum install -y ntp
echo "192.168.50.101   db1" | sudo tee /etc/hosts
echo "192.168.50.102   work2" | sudo tee -a /etc/hosts
echo "192.168.50.103   work3" | sudo tee -a /etc/hosts
echo "192.168.50.104   work4" | sudo tee -a /etc/hosts
echo "192.168.50.105   work5" | sudo tee -a /etc/hosts
sudo systemctl restart ntpd
sudo yum install epel-release
sudo yum install net-tools
SCRIPT
  config.vm.provision "shell", inline:$script 
  (2...6).each do |i|
  config.vm.define "work#{i}" do |thedb|
      thedb.vm.hostname = "work#{i}"
      thedb.vm.network "private_network", ip: "192.168.50.10#{i}"
      thedb.vm.provider "virtualbox" do |v|
            v.customize ["modifyvm", :id, "--name", "work#{i}", "--memory", "2048"]
      end    
    end
  end  
  
end
