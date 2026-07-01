output "instance_ip" {
  description = "Adresse IP publique de l'instance"
  value       = aws_instance.tp_instance.public_ip
}

output "instance_name" {
  description = "Nom de l'instance déployée"
  value       = var.instance_name
}

output "instance_id" {
  description = "Identifiant unique de l'instance EC2"
  value       = aws_instance.tp_instance.id
}

output "ssh_command" {
  description = "Commande SSH prête à l'emploi"
  value       = "ssh -i ~/.ssh/deb.pem admin@${aws_instance.tp_instance.public_ip}"
}
