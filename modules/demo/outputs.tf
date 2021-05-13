output "instance_private_ip" {
  description = "Instance private IP"
  value       = aws_instance.instance.private_ip
}
