Requirement:
- Amazon Linux 2023 (Depands on your server, for this case we are using amazon linux 2023)
- Make sure at jenkins you have plugin 'Maven Integration', 'git plugin', 'git client'

1. Make directory /var/www/html
2. Put all this repository inside that directory ("/var/www/html")

==============================
Install docker on amazon linux 2023
==============================
- sudo yum update -y
- sudo yum install -y docker
- sudo service docker start
- sudo usermod -a -G docker ec2-user
(Logout from SSH and Login again)
- docker ps
==============================
Ref: 
https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html
==============================
Quickcopy: 
sudo yum update -y && sudo yum install -y docker && sudo service docker start && sudo usermod -a -G docker ec2-user
============================================================



==============================
Install docker compose on amazon linux 2023
==============================
- sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
- sudo chmod +x /usr/local/bin/docker-compose
- docker-compose version
==============================
Ref: 
https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9
==============================
Quickcopy: 
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose && docker-compose version
============================================================



==============================
Note:
==============================
- Min 16 Gb disk
- Minimal Requirement CPU 2 Core, Ram 8 GB to install jenkins + gitlab
- Jenkins takes 500-600 MB RAM
- Gitlab takes 2,6 - 2,8 GB RAM
============================================================



==============================
Note for gitlab:
==============================
- Username for root account is "root"
- Path to get root password => /etc/gitlab/initial_root_password
============================================================



==============================
Note for jenkins:
==============================
- Run this command "sudo chown -R 1000:1000 ./jenkins" (Outside container jenkins & 1 Same directory folder) [Only for first time instalation, because when first time instalation it become root:root]
- Run this command "sudo chown -R 1000:1000 /var/run/docker.sock" (Outside container jenkins)
- To see jenkins password for first time after installation you should go to container jenkins and see the log "docker logs jenkins (adjustment with your jenkins container name)"
- Username for root account is "admin"
- Path to get root password => /var/jenkins_home/secrets/initialAdminPassword
- If there pas permission denied about archive or surefire-report run this command => docker exec -u root jenkins \
  chown -R 1000:1000 /var/jenkins_home/workspace/JOB_NAME/java-app/target
- Put code webhook at /var/opt/gitlab/git-data/repositories/@hashed/<some-hash>.git and make folder with name 'custom_hooks' 
REF => https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/49242187#content
============================================================



==============================
Get YOUR_JOB_TOKEN (jenkins jon):
==============================
1. Log in to Jenkins as a user with Configure permission on that job.
2. Navigate to the job in question (e.g. MyJob).
3. Click Configure on the left menu.
4. Scroll down to Build Triggers.
5. Check “Trigger builds remotely (e.g., from scripts)”.
6. In the Authentication Token field you’ll see either:
- An existing token (copy this), or
- An empty box—enter a new secret (e.g. mavensecrettoken) and click Save.
============================================================



==============================
Get JENKINS_API_TOKEN (jenkins jon):
==============================
1. Click your username in the top right corner.
2. Click security at left side
3. Looking API Token > Current token.
============================================================



==============================
Installation for jenkins:
==============================
- Install maven if your app is java => https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13087398#overview
- Install git => https://www.udemy.com/course/jenkins-from-zero-to-hero/learn/lecture/13087400#overview
============================================================




docker pull maven
docker run -ti -v $PWD/java-app:/app maven:latest sh
cd app
mvn package

==============================
Remote Server (Prod):
==============================
1. sudo useradd prod-user
2. sudo su
3. cd /home/prod-user
4. mkdir .ssh
5. chmod 700 .ssh/
6. vi .ssh/authorized_keys
7. copy paste xxx.pub key from jenkins server to ".ssh/authorized_keys" Remote server
8. chmod 400 .ssh/authorized_keys
9. sudo chown -R prod-user:prod-user /home/prod-user/.ssh
============================================================



