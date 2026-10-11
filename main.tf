data "kubernetes_persistent_volume_claim_v1" "persistent_volume_claim_v1_lookup" {
  for_each = var.persistent_volume_claim_v1_lookup


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {
      dynamic "selector" {
        for_each = spec.value.selector != null ? spec.value.selector : []
        content {
          dynamic "match_expressions" {
            for_each = selector.value.match_expressions != null ? selector.value.match_expressions : []
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }
          match_labels = selector.value.match_labels
        }
      }
      storage_class_name = spec.value.storage_class_name
      volume_mode        = spec.value.volume_mode
      volume_name        = spec.value.volume_name
    }
  }
}

