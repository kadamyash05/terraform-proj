# terraform-proj
A complete terraform project for a beginner


create an EC2 instance 
![image](https://github.com/user-attachments/assets/cc878a5f-48dc-4ba0-9670-7e559a21610d)

after the setup your dashboard should look something like this

then go on to terraform offical site to install terraform 
https://developer.hashicorp.com/terraform/install

now its time to install terraform

ssh into your ec2 and paste these commands


```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
terraform should be installed in your ec2 machine now, check the same using 

```bash
terraform -v
```
it should look something like this
![image](https://github.com/user-attachments/assets/17d93e42-2cb9-4018-ba56-589c2beaabf7)

terraform is installed now




