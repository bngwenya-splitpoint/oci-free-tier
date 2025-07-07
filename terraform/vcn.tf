resource "oci_core_vcn" "main" {
  compartment_id = var.compartment_ocid
  display_name   = "mivu-vcn"
  cidr_block     = var.vcn_cidr
  dns_label      = "mivu"
}
