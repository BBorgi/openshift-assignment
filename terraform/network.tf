resource "ibm_is_vpc" "borg-eu-de-vpc" {
  name = "borg-eu-de-vpc"
  address_prefix_management = "manual"
  resource_group = ibm_resource_group.borg-rg.id
}

resource "ibm_is_vpc_address_prefix" "borg-eu-de-1-addr-prefix" {
  name = "borg-eu-de-1-addr-prefix"
  zone = "eu-de-1"
  vpc  = ibm_is_vpc.borg-eu-de-vpc.id
  cidr = "192.168.1.0/24"
}

resource "ibm_is_vpc_address_prefix" "borg-eu-de-2-addr-prefix" {
  name = "borg-eu-de-2-addr-prefix"
  zone = "eu-de-2"
  vpc  = ibm_is_vpc.borg-eu-de-vpc.id
  cidr = "192.168.2.0/24"
}

resource "ibm_is_vpc_address_prefix" "borg-eu-de-3-addr-prefix" {
  name = "borg-eu-de-3-addr-prefix"
  zone = "eu-de-3"
  vpc  = ibm_is_vpc.borg-eu-de-vpc.id
  cidr = "192.168.3.0/24"
}

resource "ibm_is_subnet" "borg-eu-de-1-subnet" {
  depends_on = [
    ibm_is_vpc_address_prefix.borg-eu-de-1-addr-prefix
  ]
  name            = "borg-eu-de-1-subnet"
  vpc             = ibm_is_vpc.borg-eu-de-vpc.id
  zone            = "eu-de-1"
  ipv4_cidr_block = "192.168.1.0/24"
}

resource "ibm_is_subnet" "borg-eu-de-2-subnet" {
  depends_on = [
    ibm_is_vpc_address_prefix.borg-eu-de-2-addr-prefix
  ]
  name            = "borg-eu-de-2-subnet"
  vpc             = ibm_is_vpc.borg-eu-de-vpc.id
  zone            = "eu-de-2"
  ipv4_cidr_block = "192.168.2.0/24"
}

resource "ibm_is_subnet" "borg-eu-de-3-subnet" {
  depends_on = [
    ibm_is_vpc_address_prefix.borg-eu-de-3-addr-prefix
  ]
  name            = "borg-eu-de-3-subnet"
  vpc             = ibm_is_vpc.borg-eu-de-vpc.id
  zone            = "eu-de-3"
  ipv4_cidr_block = "192.168.3.0/24"
}