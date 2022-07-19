resource "aws_vpc" "jenkins_vpc" {
    cidr_block          = var.cidr_block
    instance_tenancy    = var.instance_tenancy
    tags                = {Name = "${terraform.workspace}-Jenkins_VPC"}
}