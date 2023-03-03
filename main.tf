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


