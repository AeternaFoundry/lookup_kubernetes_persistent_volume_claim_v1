variable "persistent_volume_claim_v1_lookup" {
  description = <<EOT
Map of persistent_volume_claim_v1_lookup, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
Optional:
    - spec (block):
        - selector (optional, block):
            - match_expressions (optional, block):
                - key (optional)
                - operator (optional)
                - values (optional)
            - match_labels (optional)
        - storage_class_name (optional)
        - volume_mode (optional)
        - volume_name (optional)
EOT

  type = map(object({
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    spec = optional(list(object({
      selector = optional(list(object({
        match_expressions = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(set(string))
        })))
        match_labels = optional(map(string))
      })))
      storage_class_name = optional(string)
      volume_mode        = optional(string)
      volume_name        = optional(string)
    })))
  }))
}

