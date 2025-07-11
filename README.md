# 🚀 Terraform Project 

This is a project to provision AWS resources using Terraform from an EC2 instance.

---

## 🛠️ Complete Setup Instructions

### 1. Launch an EC2 Instance

- Go to AWS Console and launch an Ubuntu EC2 instance.
- SSH into the instance after launch.

---

### 2. Install Terraform on EC2

SSH into your EC2 and run the following:

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y
terraform -v
```

Expected output:  
![Terraform Version](https://github.com/user-attachments/assets/17d93e42-2cb9-4018-ba56-589c2beaabf7)

---

### 3. Set Up Terraform Project

```bash
mkdir terraform && cd terraform
```

Create a file `s3.tf` and paste this content:

```hcl
resource "aws_s3_bucket" "testbucket" {
  bucket = "<your-unique-bucket-name>"

  tags = {
    Name = "<your-unique-bucket-name>"
  }
}
```

Create a file `terraform.tf` and paste this content:

```hcl
provider "aws" {
  region     = "us-east-1"
  access_key = "<YOUR_ACCESS_KEY>"
  secret_key = "<YOUR_SECRET_KEY>"
}
```

Replace `<your-unique-bucket-name>`, `<YOUR_ACCESS_KEY>`, and `<YOUR_SECRET_KEY>` with your actual values.

---

### 4. Deploy Using Terraform

to initilize terraform in your project -
```bash
terraform init
```

to validate is terraform file is correct-
```bash
terraform validate
```

to see how terraform will create a structural plan based on the file-
```bash
terraform plan
```

to apply changes and create the resources-
```bash
terraform apply
```


### 5. Verify S3 Bucket

After successful apply, you should see the bucket created in your AWS S3 Console.  
<img width="1743" height="46" alt="image" src="https://github.com/user-attachments/assets/68167295-3306-47d1-887c-01a77020f955" />


# 🚀 Terraform EC2 Setup from Local Machine

This guide will help you provision an EC2 instance on AWS using Terraform from your **local machine (VS Code terminal)** step-by-step.

---

Now lets create an EC2 instance using terraform and this time from your local machine-
## 📁 Project Setup Instructions

### 1. Create a Project Folder

Create a folder and open VS Code and execute the following commands from VS Code terminal-

---

### 2. Install Terraform

Go to the official site and install Terraform based on your OS:  
👉 https://developer.hashicorp.com/terraform/install

To verify installation:

```bash
terraform -v
```

You should see the installed Terraform version.

---

### 3. Install AWS CLI

Follow the instructions from AWS documentation:  
👉 https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

After installation, verify using:

```bash
aws --version
```

---

### 4. Configure AWS Credentials

Run the following command:

```bash
aws configure
```

It will prompt for:

- AWS Access Key ID
- AWS Secret Access Key
- Default region name (e.g., `us-east-1`)
- Default output format (can leave blank or set `json`)

These credentials will be saved locally at `~/.aws/credentials`.

---

### 5. Add Terraform Files

Use the following files from this repository (already pushed):

#### ✅ `terraform.tf`  
Sets up the AWS provider using credentials from your `aws configure`.

#### ✅ `provider.tf`  
Specifies the AWS region to use (e.g., `us-east-1`).

#### ✅ `ec2.tf`  
Contains the Terraform resource to create an EC2 instance. You can copy this from your repo and modify as needed (e.g., AMI, instance type, tags, etc).

---

### 6. Terraform Commands

Run the following **in the terminal** (inside your project folder):

```bash
terraform init
```
➡️ Initializes the Terraform working directory and downloads the AWS provider plugin.

```bash
terraform validate
```
➡️ Checks your `.tf` files for syntax errors.

```bash
terraform plan
```
➡️ Shows what Terraform will create on AWS (a dry run).

```bash
terraform apply
```
➡️ Applies the changes — i.e., actually creates the EC2 instance on AWS. Confirm with `yes` when prompted.

---

## ✅ After Applying

Once complete:

- You’ll see the EC2 instance details in the terminal.
- You can go to the **AWS EC2 Console** and verify the instance has been created.

---

<img width="1555" height="231" alt="image" src="https://github.com/user-attachments/assets/0468326b-5e2f-438e-9260-5053dda805c5" />

