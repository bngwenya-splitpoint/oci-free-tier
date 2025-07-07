resource "oci_core_subnet" "public" {
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.main.id
  cidr_block        = var.public_subnet_cidr
  display_name      = "public-subnet"
  dns_label         = "public"
  route_table_id    = oci_core_route_table.public.id
  security_list_ids = [oci_core_security_list.public.id]
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "private" {
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.main.id
  cidr_block        = var.private_subnet_cidr
  display_name      = "private-subnet"
  dns_label         = "private"
  route_table_id    = oci_core_route_table.private.id
  security_list_ids = [oci_core_security_list.private.id]
  prohibit_public_ip_on_vnic = true
}
