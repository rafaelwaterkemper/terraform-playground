locals {
  map1 = yamldecode(file("./conf.yaml"))
  map2 = {
    key1-1 = {
        key1-1-1 = "value1-1-1(overwrite)"
        key1-1-3 = {
            key1-1-3-2 = "value1-1-3-2(overwrite)"
            key1-1-3-3 = {
                key1-1-3-3-1 = "value1-1-3-3-1"
            }
        }
        key1-1-4 = "value1-1-4"
    }
    key1-2 = {
        key1-2-1 = "value1-2-1"
        key1-2-2 = "value1-2-2"
        key1-2-3 = {
            key1-2-3-1 = "value1-2-3-1"
        }
    }
    key1-3 = "value1-3(overwrite)"
  }

  map3 = {
    key1-3 = "value1-3(double-overwrite)"
    key1-2 = {
        key1-2-3 = {
            key1-2-3-2 = "value1-2-3-2"
        }
    }
  }
}

module "deepmerge" {
  source = "Invicton-Labs/deepmerge/null"
  maps = [
    local.map1,
    local.map2,
    local.map3
  ]
}

// The merged map
output "merged" {
    value = module.deepmerge.merged
}