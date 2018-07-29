provider "aws" {
  access_key = "xxxx"
  secret_key = "xxxx"
  region     = "us-east-1"
}

resource "aws_instance" "docker_provider" {
  ami           = "ami-0a2c9ddf8ea042cc1"
  instance_type = "t2.micro"
  count             = 1
  key_name      = "personalkey"
  security_groups = ["default"]
  tags { Name = "Docker_Provider" }
}

resource "aws_instance" "docker_manager" {
  ami           = "ami-0daaf0688c6f6ce2a"
  instance_type = "t2.micro"
  count             = 1
  key_name      = "personalkey"
  security_groups = ["default"]
  tags { Name = "Docker_Manager" }
}

resource "aws_instance" "docker_worker_1" {
  ami           = "ami-0d6800db6f3005cb4"
  instance_type = "t2.micro"
  count             = 1
  key_name      = "personalkey"
  security_groups = ["default"]
  tags { Name = "Docker_Worker_1" }
}

resource "aws_instance" "docker_worker_2" {
  ami           = "ami-0a7f2061bb57f0c85"
  instance_type = "t2.micro"
  count             = 1
  key_name      = "personalkey"
  security_groups = ["default"]
  tags { Name = "Docker_Worker_2" }
}