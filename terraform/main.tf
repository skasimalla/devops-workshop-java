terraform {

  backend "s3" {
    bucket  = "coworks-terraform-state-files"
    key     = "dev/terraform2.tfstate"
    region  = "us-east-1"
    profile = "coworks"
  }
}


provider "aws" {
  region  = "us-east-1"
  profile = "coworks"

}


resource "aws_instance" "web" {

  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  key_name      = "sam-coworks"

  tags = {
    Name = "petclinic-ec2-tf"
  }

}

