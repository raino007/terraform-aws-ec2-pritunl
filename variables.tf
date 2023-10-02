variable "instance_type" {
  type        = string
  description = "The instance type"
}

variable "instance_ami" {
  type        = list(any)
  description = "The instance ami"
}

variable "name" {
  type        = string
  description = "The Instance name"
}

variable "key_name" {
  type        = string
  description = "The EC2 Keypair name"
}

variable "subnet_id" {
  type        = string
  description = "The EC2 subnet"
}

variable "vol_size" {
  type        = number
  description = "The EC2 volume size"
}

variable "vpc_id" {
  type        = string
  description = "The VPC id "
}

variable "attach_elastic_ip" {
  type        = bool
  description = "attach elastic ip/not"
}

variable "vpn_udp_port" {
  type        = number
  description = "This is the UDP port used for Pritunl VPN connections"
}
