resource "aws_instance" "my-ec2"{
    ami="ami-060d3509162bcc386"
    instance_type="t2.micro"
    tags={
      Name=var.tage-name
    }
    vpc_security_group_ids =[aws_security_group.allow_ssh.id]
}

resource  "aws_eip" "my-eip"{
    vpc = true
}

resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-ec2.id
    allocation_id=aws_eip.my-eip.id

}

output "eip_value" {
    description = "VM IP"
    value= aws_instance.my-ec2.public_ip
}

output "ec2_name" {
    description = "VM name"
    value= aws_instance.my-ec2.tags.Name
}

output "ec2_ami" {
    description = "VM ami"
    value= aws_instance.my-ec2.ami
}

resource "aws_security_group" "allow_ssh"{
    name        = "SG_mariam_allow_ssh"
    description = "Allow ssh inbound traffic"

    ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks=["0.0.0.0/0"]
    }
}
