output "vcn_id" {
  value = oci_core_vcn.main.id
}

output "public_subnet_id" {
  value = oci_core_subnet.public.id
}

output "private_subnet_id" {
  value = oci_core_subnet.private.id
}


output "kubeconfig_command" {
  value = "oci ce cluster create-kubeconfig --cluster-id ${oci_containerengine_cluster.oke_cluster.id} --file ./kubeconfig --region ${var.region} --token-version 2.0.0"
}