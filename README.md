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

create a folder now named terraform in the ec2 instance

make the file in that folder called s3.tf

now copy paste the content from s3.tf folder in your file and make your you change your s3 bucket name as it should be unique globally

run the following commands

```bash
terraform init
```
this is initialize terraform in your folder

now install aws cli from the documentation, once installed, now time to configure aws account to ec2 machine

```bash
aws configure 
```

this will ask for access key and secret key, you'll get the same from your comsole in security and credential section

```bash
terraform validate
```
this is used to check if the terraform file is correct

```bash
terraform plan 
```
this will give you a structure plan of what terraform will create

```bash
terraform apply
```

this will apply the changes and create the resource

once done a s3 bicket should be created

