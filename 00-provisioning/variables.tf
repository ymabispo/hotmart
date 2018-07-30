variable "aws_region" {
  description = "Região AWS"
  default = "us-east-1"
}

variable "ami_provider" {
  description = "Imagem a ser utilizada como provisionador"
  default = "ami-4fffc834"
}

variable "ami_swarm_manager" {
  description = "Imagem a ser utilizada como gerenciador do swarm"
  default = "ami-4fffc834"
}

variable "ami_swarm_worker" {
  description = "Imagem a ser utilizada como executor do swarm"
  default = "ami-4fffc834"
}

variable "instance_type" {
  description = "Tipo da Instância"
  default = "t2.micro"
}

variable "key_name" {
  description = "chave para conexão SSH"
  default = "personalkey"
}