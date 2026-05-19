# -----------------------------
# VPC OUTPUTS
# -----------------------------

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

# -----------------------------
# SECURITY GROUP OUTPUTS
# -----------------------------

output "api_security_group_id" {
  value = aws_security_group.api_sg.id
}

output "worker_security_group_id" {
  value = aws_security_group.worker_sg.id
}

# -----------------------------
# API SERVER OUTPUTS
# -----------------------------

output "api_public_ip" {
  value = aws_instance.api.public_ip
}

output "api_private_ip" {
  value = aws_instance.api.private_ip
}

# -----------------------------
# WORKER OUTPUTS
# -----------------------------

output "worker1_private_ip" {
  value = aws_instance.worker1.private_ip
}

output "worker2_private_ip" {
  value = aws_instance.worker2.private_ip
}

output "worker3_private_ip" {
  value = aws_instance.worker3.private_ip
}