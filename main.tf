# ─── DATA SOURCE : dernière image Debian 12 ──────────────────────────────────
# Récupère l'AMI Debian la plus récente sans rien créer.
data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"] # Compte officiel Debian

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ─── SECURITY GROUP : pare-feu autorisant le SSH ─────────────────────────────
resource "aws_security_group" "ssh" {
  name        = "tp-jour1-ssh"
  description = "Autorise le SSH entrant"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # TP uniquement : ouvert à tous
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    env    = "formation"
    auteur = var.author
  }
}

# ─── RESOURCE : instance EC2 Debian ──────────────────────────────────────────
resource "aws_instance" "tp_instance" {
  ami                    = data.aws_ami.debian.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name     = var.instance_name
    env      = "formation"
    cours    = "iac"
    auteur   = var.author
    jour     = "3"
    pipeline = "github-actions"
  }
}
