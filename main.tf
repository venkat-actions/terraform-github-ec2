resource "aws_instance" "runner"{
    ami= data.aws_ami.rhel9.id 
    instance_type= "t3.micro"
    vpc_security_group_ids= [aws_security_group.allow_all.id]
    tags={
        Name= "${var.project}-${var.environment}"
    }
}

resource "aws_security_group" "allow_all"{
    name= "${var.project}-${var.environment}"
    description= "this sg for runner"
    ingress{
        from_port= "0"
        to_port= "0"
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
    egress{
        from_port= "0"
        to_port= "0"
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
    tags={
        Name= "${var.project}-${var.environment}-allow-all"
    }

}