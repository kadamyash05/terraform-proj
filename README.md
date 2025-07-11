# Terraform Project

This project provisions AWS resources using Terraform in two environments:

1. From an EC2 instance (remote setup)
2. From your local machine using the VS Code terminal

---

## Part 1: Provisioning an S3 Bucket from an EC2 Instance

### 1. Launch an EC2 Instance

- Go to the AWS Console and launch an Ubuntu EC2 instance.
- After it's running, SSH into the instance.

### 2. Install Terraform on the EC2 Instance

Run the following commands inside the EC2 terminal:

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y
terraform -v
```

This installs Terraform and verifies the version.

### 3. Set Up the Terraform Project on EC2

Create a project folder and move into it:

```bash
mkdir terraform && cd terraform
```

Create a file called `s3.tf` and paste the following content:

```hcl
resource "aws_s3_bucket" "testbucket" {
  bucket = "<your-unique-bucket-name>"

  tags = {
    Name = "<your-unique-bucket-name>"
  }
}
```

Create another file `terraform.tf` and add this:

```hcl
provider "aws" {
  region     = "us-east-1"
  access_key = "<YOUR_ACCESS_KEY>"
  secret_key = "<YOUR_SECRET_KEY>"
}
```

Replace placeholders with your actual AWS credentials and unique bucket name.

### 4. Run Terraform Commands

```bash
terraform init
```
Initializes the working directory.

```bash
terraform validate
```
Validates the configuration syntax.

```bash
terraform plan
```
Displays what Terraform will do.

```bash
terraform apply
```
Applies the configuration and provisions the S3 bucket.

### 5. Verify S3 Bucket

Check the AWS S3 Console to confirm the bucket has been created.  
![S3 Bucket](https://github.com/user-attachments/assets/68167295-3306-47d1-887c-01a77020f955)

---

## Part 2: Creating an EC2 Instance from Local Machine (VS Code Terminal)

### 1. Set Up the Project

Create a folder, open it in VS Code, and initialize the terminal.

### 2. Install Terraform

Install Terraform from the official documentation:  
https://developer.hashicorp.com/terraform/install

Verify installation:

```bash
terraform -v
```

### 3. Install AWS CLI

Install AWS CLI from:  
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

Verify installation:

```bash
aws --version
```

### 4. Configure AWS CLI

Run:

```bash
aws configure
```

Provide:

- AWS Access Key ID  
- AWS Secret Access Key  

This stores credentials in `~/.aws/credentials`.

Before provisioning an EC2 instance, generate an SSH key pair:

```bash
ssh-keygen 
```

- When prompted, save the key to `~/.ssh/id_rsa` (default) or specify a path.
- Can name the file like terraec2

### 5. Use Existing Terraform Files

Use the following files already available in this repo:

- `terraform.tf`: Sets the AWS provider block.
- `provider.tf`: Specifies the region.
- `ec2.tf`: Defines the EC2 instance to be created.

Modify these files as needed (e.g., AMI ID, instance type).

### 6. Execute Terraform Commands

From your project directory, run:

```bash
terraform init
```
Initializes the project.

```bash
terraform validate
```
Validates syntax.

```bash
terraform plan
```
Previews changes.

```bash
terraform apply
```
Applies the plan and creates the EC2 instance.

### 7. Verify EC2 Instance

Go to the AWS EC2 Console and check that the instance has been created.  
![EC2](https://github.com/user-attachments/assets/0468326b-5e2f-438e-9260-5053dda805c5)
