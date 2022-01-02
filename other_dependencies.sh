echo "**************************************Installing jq and vim*******************************"
apt-get update
apt-get install jq -y
apt-get install vim -y
echo "**************************************jq installed*******************************"
echo "Installing nodejs"
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install nodejs -y
node --version
echo "**************************************nodejs installed*******************************"
echo "*************************************setting git configurations******************"
username=`jq '.username' /var/jenkins_home/config.json`
useremail=`jq '.useremail' /var/jenkins_home/config.json`
git config --system user.name cartos_jenkins $username
git config --system user.email $useremail
echo "****************************************installing goLang********************"
wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
tar -C /usr/local -xf go1.13.5.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
cp /usr/local/go/bin/* /usr/bin
go version
rm go1.13.5.linux-amd64.tar.gz
echo "***********************go installed**************************"
echo "***********************installing dotnet*********************"
wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget https://packages.microsoft.com/config/debian/9/prod.list
mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
chown root:root /etc/apt/sources.list.d/microsoft-prod.list
apt-get update
apt-get install dotnet-sdk-3.1 -y
dotnet --version
echo "***********************Installed dotnet**************************"
echo "***********************Installing terraform**************************"
apt-get install unzip -y
wget https://releases.hashicorp.com/terraform/0.10.5/terraform_0.10.5_linux_amd64.zip
unzip terraform_0.10.5_linux_amd64.zip
mv terraform /usr/local/bin/
terraform --version
rm terraform_0.10.5_linux_amd64.zip
echo "***********************Installed terraform**************************"