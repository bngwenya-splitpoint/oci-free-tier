variable "compartment_ocid" {}
variable "region" {}
variable "vcn_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "oke_k8s_version" {
  default = "v1.33.1" # Use a supported version
}

variable "availability_domain" {
  description = "The availability domain where OKE node pool will be placed"
  type        = string
}

variable "node_pool_image_id" {
  description = "Image OCID for worker nodes"
  type        = string
}

variable "vcn_cidr_block" {
  description = "CIDR block for the VCN"
  type        = string
  default     = "10.0.0.0/16"   # or your actual VCN CIDR block
}

