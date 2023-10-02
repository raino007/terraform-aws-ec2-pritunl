output "instance_id" {
  value       = aws_instance.EC2.id
  description = "The instance id of EC2"
}

output "instance_public_ip" {
  value = aws_instance.EC2.public_ip
  description = "The instance public ip"
}