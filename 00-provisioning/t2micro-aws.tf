provider "aws" {
  access_key = "xxxx"
  secret_key = "xxxx"
  region     = "${var.aws_region}"
}

resource "aws_instance" "docker_manager" {
  ami           = "${var.ami_swarm_manager}"
  instance_type = "${var.instance_type}"
  count             = 1
  key_name      = "${var.key_name}"  
  security_groups = ["default"]
  tags { Name = "Docker_Manager" }
  
   
}

resource "aws_instance" "docker_worker" {
  ami           = "${var.ami_swarm_worker}"
  instance_type = "${var.instance_type}"
  count             = 2
  key_name      = "${var.key_name}"  
  security_groups = ["default"]
  tags { Name = "Docker_Worker_${count.index}" }
  
    
}
