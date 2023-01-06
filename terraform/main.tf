
/*terraform {
  backend "s3" {
    bucket  = "terraform-state-files"
    key     = "dev/terraform2.tfstate"
    region  = "us-east-1"
    profile = "lab1"
  }
}
*/

provider "aws" {
  region  = "us-east-1"
  profile = "lab1"

}

resource "aws_instance" "web" {

  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  key_name      = "sam-lab1"

  tags = {
    Name = "petclinic-ec2-tf"
  }

}

