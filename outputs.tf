output "persistent_volume_claim_v1_lookup_id" {
  description = "Map of id values across all persistent_volume_claim_v1_lookup, keyed the same as var.persistent_volume_claim_v1_lookup except keys with no id are omitted"
  value       = { for k, v in data.kubernetes_persistent_volume_claim_v1.persistent_volume_claim_v1_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "persistent_volume_claim_v1_lookup_metadata" {
  description = "Map of metadata values across all persistent_volume_claim_v1_lookup, keyed the same as var.persistent_volume_claim_v1_lookup except keys with no metadata are omitted"
  value       = { for k, v in data.kubernetes_persistent_volume_claim_v1.persistent_volume_claim_v1_lookup : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "persistent_volume_claim_v1_lookup_spec" {
  description = "Map of spec values across all persistent_volume_claim_v1_lookup, keyed the same as var.persistent_volume_claim_v1_lookup except keys with no spec are omitted"
  value       = { for k, v in data.kubernetes_persistent_volume_claim_v1.persistent_volume_claim_v1_lookup : k => v.spec if v.spec != null && length(v.spec) > 0 }
}

