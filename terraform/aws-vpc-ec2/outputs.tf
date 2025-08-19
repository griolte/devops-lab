output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = [for s in aws_subnet.public : s.id] }
output "private_subnet_ids" { value = [for s in aws_subnet.private : s.id] }
output "security_group_id" { value = aws_security_group.ec2.id }
output "instance_id" { value = aws_instance.web.id }
output "instance_public_ip" { value = aws_instance.web.public_ip }
output "instance_public_dns" { value = aws_instance.web.public_dns }
