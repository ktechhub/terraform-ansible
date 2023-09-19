output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "ig_id" {
  value = aws_internet_gateway.ig.id
}


output "instances" {
  value = [
    for i, vm in aws_instance.instance : {
      private_ip : vm.private_ip
      public_ip : vm.public_ip
    }
  ]
}