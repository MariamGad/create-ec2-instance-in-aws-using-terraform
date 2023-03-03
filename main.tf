resource "aws_instance" "my-ec2"{
    ami="ami-060d3509162bcc386"
    instance_type="t2.micro"
    tags={
      Name="instance01-mariam"
    }
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
    description = "VM IP"
    value= aws_instance.my-ec2.tags.Name
}

output "ec2_ami" {
    description = "VM IP"
    value= aws_instance.my-ec2.ami
}