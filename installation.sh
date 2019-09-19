
#!/bin/bash/
#######################################
# Bash script to install Git/Jenkins/Sonarqube/docker/ansible/tomcat on a new system [RHEL-8]
# Written by cloudarchitectaws@gmail.com - Siva
#######################################
func () {
	echo '################################'
	echo
	echo -e "\n"
}


## Update packages and Upgrade system
func 
sudo yum update -y
func 

## Git ##
func 
echo '###Installing Git..'
sudo yum install git -y
func 

# Git Configuration
func 
echo '###Congigure Git..'
func 
echo "Enter the Global Username for Git:";
func 
read GITUSER;
git config --global user.name "${GITUSER}"
func 

echo "Enter the Global Email for Git:";
func 
read GITEMAIL;
git config --global user.email "${GITEMAIL}"
func 

echo 'Git has been configured!'
func 
git config --list
func 

echo #####Jenkins Installation #####
func 
echo 'Installing Jenkins and associated packages'
func 
yum -y install java-1.8.0-openjdk wget
func 


echo 'Adding Jenkins Key to the system'
func 
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
func 

echo 'Adding Jenkins Repository to the system'
func 
cd /etc/yum.repos.d/
curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo
func 

echo 'Its time to install Jenkins Package'
func 
yum install jenkins -y 
func 

echo 'Jenkins Service Management'
func 
 
systemctl start jenkins
systemctl enable jenkins
systemctl status jenkins | grep -i Active


echo '###Jenkins Admin Passowd####'
func 
PASSWD=`cat /var/lib/jenkins/secrets/initialAdminPassword`
echo $PASSWD
func 


echo '#### Launching Jenkins GUI in the Browser######'
#wget --user=<user> --password=$PASSWD http://localhost:8080





