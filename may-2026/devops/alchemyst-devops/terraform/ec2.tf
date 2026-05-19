# -----------------------------
# API SERVER
# -----------------------------

resource "aws_instance" "api" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.api_sg.id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "api-server"
  }
}

# -----------------------------
# WORKER 1
# -----------------------------

resource "aws_instance" "worker1" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private.id

  vpc_security_group_ids = [
    aws_security_group.worker_sg.id
  ]

  key_name = "alchemyst-key"

  tags = {
    Name = "worker-1"
  }
}

# -----------------------------
# WORKER 2
# -----------------------------

resource "aws_instance" "worker2" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private.id

  vpc_security_group_ids = [
    aws_security_group.worker_sg.id
  ]

  key_name = var.key_name

  tags = {
    Name = "worker-2"
  }
}

# -----------------------------
# WORKER 3
# -----------------------------

resource "aws_instance" "worker3" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private.id

  vpc_security_group_ids = [
    aws_security_group.worker_sg.id
  ]

  key_name = var.key_name

  tags = {
    Name = "worker-3"
  }
}