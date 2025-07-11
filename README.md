# 🚀 Terraform Project for Beginners

This is a beginner-friendly project to provision AWS resources using Terraform from an EC2 instance.

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

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

---

### 5. Verify S3 Bucket

After successful apply, you should see the bucket created in your AWS S3 Console.  
<img width="1743" height="46" alt="image" src="https://github.com/user-attachments/assets/68167295-3306-47d1-887c-01a77020f955" />
