resource "oci_containerengine_cluster" "oke_cluster" {
  name               = "mivu-oke-cluster"
  compartment_id     = var.compartment_ocid
  vcn_id             = resource "oci_containerengine_cluster" "oke_cluster" {
  name               = "mivu-oke-cluster"
  compartment_id     = var.compartment_ocid
  vcn_id             = oci_core_vcn.main.id
  kubernetes_version = "v1.33.1"

  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = oci_core_subnet.public.id  # Subnet for control plane endpoint
  }

  options {
    add_ons {
      is_kubernetes_dashboard_enabled = false
    }

    admission_controller_options {
      is_pod_security_policy_enabled = false
    }
  }
}

  kubernetes_version = "v1.33.1"

  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = oci_core_subnet.public.id  # Subnet for control plane endpoint
  }

  options {
    add_ons {
      is_kubernetes_dashboard_enabled = false
    }

    admission_controller_options {
      is_pod_security_policy_enabled = false
    }
  }
}
