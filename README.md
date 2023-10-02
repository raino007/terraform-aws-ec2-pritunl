![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
# Terraform Module for Pritunl VPN Server Deployment
This Terraform module simplifies the deployment of a Pritunl VPN server on an Amazon Elastic Compute Cloud (EC2) instance. It streamlines the process of setting up a Pritunl VPN, offering a fundamental installation. Moreover, we're thrilled to share that we have forthcoming updates planned to enhance its functionality.
## About Pritunl
Pritunl is an open-source VPN server that provides secure and easy-to-use VPN access for various use cases, from remote access to site-to-site connections.
## Key Features
**Simplified Deployment**: Easily deploy a Pritunl VPN server on EC2 with minimal configuration.

**Future Enhancements**: We have an exciting roadmap of additional features and improvements in the pipeline, including enhanced security, advanced configuration options, and more. 

Stay tuned for updates in upcoming releases!
## Prerequisites
Before you begin, ensure you have the following prerequisites in place:
1. An AWS account with the necessary permissions.
2. Terraform installed on your local machine.
3. An existing Virtual Private Cloud (VPC) within your AWS account.
4. An SSH key pair for securely accessing the EC2 instance.
## Usage
Check valid versions on:
* Github Releases: https://github.com/raino007/terraform-aws-ec2-pritunl/releases
* Terraform Module Registry: https://registry.terraform.io/modules/raino007/ec2-pritunl/aws/latest
## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
## Example
```
module "ec2-pritunl" {
    source  = "raino007/ec2-pritunl/aws"
    version = "1.0.0"
    name              = "Pritunl"
    instance_type     = "t3a.small"
    instance_ami      = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
    key_name          = "KeyName"
    subnet_id         = "subnet-xx"
    attach_elastic_ip = "false"
    vol_size          = 30
    vpc_id            = "vpc-XX"
    vpn_udp_port      = 1194
}
```
## Accessing Pritunl Dashboard

NB: After successfully provisioning the Pritunl instance, it may take approximately 5 minutes for the server to initialize and the Pritunl dashboard to become accessible.
You can access the pritunl dashboard using **https://PUBLIC_IP**
## Inputs
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="name"></a> [name](#input\_name) | The EC2 instance name | string | yes |
| <a name="instance_type"></a> [instance_type](#input\instance_type) | The instance type | string | yes |
| <a name="instance_ami"></a> [instance_ami ](#input\instance_ami ) | The ubuntu ami | list | yes |
| <a name="key_name"></a> [key_name ](#input\key_name ) | The name of the key pair used for SSH  | string | yes |
| <a name="subnet_id"></a> [subnet_id](#input\subnet_id) | The public subnet ID | any | yes |
| <a name="attach_elastic_ip"></a> [attach_elastic_ip](#input\attach_elastic_ip) | Attach elastic IP | bool | yes |
| <a name="vol_size"></a> [vol_size](#input\vol_size) | The EBS volume size | number | yes |
| <a name="vpc_id"></a> [vpc_id](#input\vpc_id) | The VPC id  | string | yes |
| <a name="vpn_udp_port"></a> [vpn_udp_port](#input\vpn_udp_port) | This is the UDP port used for Pritunl VPN connections | number | yes | 

## License

This module is open-source and is licensed under the [Apache License 2.0](LICENSE). You can find a copy of the license in the [LICENSE](LICENSE) file.

We encourage contributions, issue reports, and feature suggestions through GitHub Issues.

Enjoy using the module with the flexibility of the Apache License 2.0!