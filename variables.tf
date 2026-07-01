variable "region" {
  description = "Région AWS cible"
  type        = string
  default     = "eu-west-3"
}

variable "instance_name" {
  description = "Nom de l'instance à créer"
  type        = string
  default     = "tp-jour1"
}

variable "instance_type" {
  description = "Taille de l'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nom de la key pair AWS pour le SSH"
  type        = string
}

variable "author" {
  description = "Votre prénom (pour les tags)"
  type        = string
}
