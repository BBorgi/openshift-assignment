terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.62.0"
    }
  }
}

provider "ibm" {
  region        = var.region
  zone          = var.zone
#  generation    = 2 //deprecated
}