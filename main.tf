/* Setup our aws provider */
provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}
resource "aws_vpc_dhcp_options" "internal" {
  domain_name = "${var.internal_domain}"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags {
    Name = "${var.internal_domain}"
  }
}

resource "aws_vpc_dhcp_options_association" "internal" {
  vpc_id = "${var.vpc_id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.internal.id}"
}