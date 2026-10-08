resource "aws_s3_bucket" "devsecops_artifacts" {
  bucket = "devsecops-artifacts"
}

resource "aws_instance" "devsecops_ec2" {
  ami           = "ami-amazonlinux2023"
  instance_type = "t3.micro"

  tags = {
    Name        = "devsecops-ec2"
    Environment = "devsecops"
    ManagedBy   = "terraform"
  }
}
