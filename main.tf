terraform {
  required_version = ">= 1.6"
}

# Provider-specific VM resources belong in a module. The inventory below is
# intentionally provider-neutral: copy it into your provider module and map
# name, role, size and network to provider resources.
locals {
  servers = {
    edge-01   = { role = "edge",       size = "small" }
    k8s-cp-01 = { role = "controlplane", size = "medium" }
    k8s-w-01  = { role = "worker",     size = "medium" }
    k8s-w-02  = { role = "worker",     size = "medium" }
    obs-01    = { role = "observability", size = "large" }
    ops-01    = { role = "operations", size = "small" }
  }
}

output "server_plan" {
  value       = local.servers
  description = "Role inventory to map into the selected cloud module."
}
