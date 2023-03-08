
provider "aws" {
  region = "eu-west-2"
}

variable "ingressrules" {   #1
    type = list(number)
    default = [80,443]
}

variable "engressrules" {   #2
    type = list(number)
    default = [80,443,25,3306,53,8080]
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"   #Required
    instance_type = "t2.micro"      #Required
    security_groups = [aws_security_group.webtraffic.name]  #6
}

resource "aws_security_group" "webtraffic" {        #3
    name = "Allow HTTPS"
    
    dynamic "ingress" {   #This will allow our traffic IN     #4
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {    #This will allow our traffic OUT    #5
       terator = port
        for_each = var.engressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}