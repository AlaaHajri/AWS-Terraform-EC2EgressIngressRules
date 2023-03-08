# TerraformEC2EgressIngressRules
 TerraformEC2EgressIngressRules

# Introduction
This is a Terraform script written in HashiCorp Configuration Language (HCL) that provisions an EC2 instance and configures its security group to allow inbound and outbound traffic for specific ports.

The script starts by defining the AWS provider and the region where the EC2 instance will be deployed. Then, it defines two variables ingressrules and egressrules, which specify the list of ports that will be allowed for inbound and outbound traffic respectively.

Next, the script creates an EC2 instance with the specified Amazon Machine Image (AMI) and instance type. The security group for this instance is defined in the aws_security_group resource, named "webtraffic". This security group will allow inbound traffic for the ports defined in ingressrules variable and outbound traffic for the ports defined in the egressrules variable.

The dynamic blocks in the aws_security_group resource use the for_each argument to iterate over the list of ports defined in the ingressrules and egressrules variables respectively. The from_port, to_port, and protocol arguments are set to allow traffic on the specified TCP ports. The cidr_blocks argument is set to allow traffic from any IP address.

Overall, this script sets up a basic EC2 instance with a security group that allows inbound and outbound traffic for specific ports, and can be customized by modifying the values of ingressrules and egressrules variables.