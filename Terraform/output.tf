output "stg_instance_ips" {
  description = "Public IPs of all EC2 instances from AWS-Infra module"
  value       = module.stg-Infra.instance_ips
}

output "prod_instance_ips" {
  description = "Public IPs of all EC2 instances from AWS-Infra module"
  value       = module.Prod-Infra.instance_ips
}


output "dev_instance_ips" {
  description = "Public IPs of all EC2 instances from AWS-Infra module"
  value       = module.Dev-Infra.instance_ips
}

