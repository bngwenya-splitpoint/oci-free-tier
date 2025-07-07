resource "oci_containerengine_node_pool" "mivu_node_pool" {
  compartment_id      = var.compartment_ocid
  cluster_id          = oci_containerengine_cluster.mivu_cluster.id
  name                = "mivu-node-pool"
  kubernetes_version  = "v1.33.1"
  node_shape          = "VM.Standard.E3.Flex"
  node_source_details {
    source_type = "IMAGE"
    image_id    = data.oci_core_images.oke_node_image.images[0].id
  }
  node_shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }

  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = oci_core_subnet.oke_node_subnet.id
    }

    size             = 0
    nsg_ids          = []
    is_pv_encryption_in_transit_enabled = false
  }

  initial_node_labels {
    key   = "name"
    value = "mivu-node"
  }

  ssh_public_key = file("~/.ssh/id_rsa.pub")

  node_eviction_node_pool_settings {
    eviction_grace_duration = "PT60M"  # 60 minutes
  }

  pod_configuration {
    nsg_ids   = []
    subnet_id = oci_core_subnet.oke_node_subnet.id
    max_pods_per_node = 31
  }

  node_pool_cycling_details {
    is_node_cycling_enabled = false
  }

  lifecycle {
    ignore_changes = [node_config_details[0].size]  # Since total worker nodes = 0
  }
}
