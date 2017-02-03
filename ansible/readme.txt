sudo apt-get -y install libssl-dev python-pip git
sudo apt-get -y remove ansible
sudo pip install --upgrade pip
sudo pip install --upgrade ansible

git clone https://github.com/greatehop/scripts_and_configs
cd scripts_and_configs/ansible/

# to configure localhost
ansible-playbook -i "localhost," -c local install.yml -K

# to configure remote host
echo -e "[host_alias]\nexample.com:44444 ansible_user=root" | sudo tee /etc/ansible/hosts
ansible-playbook install.yml --skip-tags "gui" -k

# install/configure LEMP (Linux + nginx + php-fpm + Let'sEncrypt certs)
ansible-playbook lemp.yml -k

# install/configure LAMP (Linux + apache + fastcgi + Let'sEncrypt certs)
ansible-playbook lamp.yml -k

# basic configuration
ansible-playbook basic.yml -k
