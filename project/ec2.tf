provider "aws" {
  region ="ap-south-1"
  access_key = "AKIA5KITMAFYJUEWTOPO" 
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami = "ami-00782a7608c7fc226"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  user_data = file("jenkins.sh")
  availability_zone = "ap-south-1a"
  key_name = "iamubumtu" 
  tags = {
    Name = "Master"
  }
}
resource "aws_instance" "web1" {
  ami = "ami-00782a7608c7fc226"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  user_data  = file("docker.sh")
  key_name = "iamubumtu"
  availability_zone = "ap-south-1a" 
  tags = {
    Name = "Node1"
  }
}
resource "aws_instance" "web2" {
  ami = "ami-026f33d38b6410e30"
  instance_type = "t2.medium"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  key_name = "iamubumtu"
  availability_zone = "ap-south-1a" 
  tags = {
    Name = "K8master"
  }
}
resource "aws_instance" "web3" {
  ami = "ami-026f33d38b6410e30" 
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  key_name = "iamubumtu"
  availability_zone = "ap-south-1a" 
  tags = {
    Name = "Workernode"
  }
}


