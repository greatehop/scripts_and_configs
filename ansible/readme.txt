sudo apt-get -y install libssl-dev python-pip git
sudo apt-get -y remove ansible
sudo pip install --upgrade pip
sudo pip install --upgrade ansible

git clone https://github.com/greatehop/scripts_and_configs
cd scripts_and_configs/ansible/

ansible-playbook -i "localhost," -c local install.yml -K
