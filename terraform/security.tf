resource "oci_core_security_list" "public" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "public-sec-list"

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 443
    }
  }

  # 🔒 Allow kube API port from within VCN (used by private subnet nodes)
  ingress_security_rules {
    protocol = "6"
    source   = var.vcn_cidr_block

    tcp_options {
      min = 6443
      max = 6443
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "private" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "private-sec-list"

  # 🔓 Allow all inbound traffic within the VCN (node-to-node + control plane)
  ingress_security_rules {
    protocol = "all"
    source   = var.vcn_cidr_block
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}
