provider "aws" {
  access_key = "AKIAVHXAXJNCHAVMMIO7"
  secret_key ="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"
  region     = "us-east-2"
}

resource "aws_instance" "DevOps_project" {
  ami           = "ami-0f57b4cec24530068"
  instance_type = "t2.micro"
  key_name = "SK36"
  security_groups= [ "project_jenkins"]
  tags= {
    Name = "jenkins_instance"
  }
}
#Create security group with firewall rules
resource "aws_security_group" "project_jenkins" {
  name        = "project_jenkins"
  description = "security group for the jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "project_jenkins"
 }
}
