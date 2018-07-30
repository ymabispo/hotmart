variable "aws_region" {
  description = "Região AWS"
  default = "us-east-1"
}

variable "ami_swarm_manager" {
  description = "Imagem a ser utilizada como gerenciador do swarm"
  default = "ami-0daaf0688c6f6ce2a"
}

variable "ami_swarm_worker" {
  description = "Imagem a ser utilizada como executor do swarm"
  default = "ami-0d6800db6f3005cb4"
}

variable "instance_type" {
  description = "Tipo da Instância"
  default = "t2.micro"
}

variable "key_name" {
  description = "chave para conexão SSH"
  default = "personalkey"
}

variable "bootstrapDocker_path" {
  description = "Script para instalar o docker"
  default = "docker.sh"
}

