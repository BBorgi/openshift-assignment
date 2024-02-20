resource "ibm_resource_instance" "borg-cos" {
  name     = "borg-cos"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "global"
}

resource "ibm_container_vpc_cluster" "borg-cluster" {
  name              = "borg-cluster"
  vpc_id            = ibm_is_vpc.borg-eu-de-vpc.id
  kube_version      = "4.14.8_openshift"
  flavor            = "bx2.4x16"
  worker_count      = "2"
  cos_instance_crn  = ibm_resource_instance.borg-cos.id
  resource_group_id = ibm_resource_group.borg-rg.id
  disable_public_service_endpoint   = false
  force_delete_storage  = true
  zones {
      subnet_id = ibm_is_subnet.borg-eu-de-1-subnet.id
      name      = "eu-de-1"
    }
}