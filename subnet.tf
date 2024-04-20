resource "aws_subnet" "main" {
  vpc_id     = module.vpc.vpc_id
  cidr_block = "${var.prefixCidr}.104.0/24"
}