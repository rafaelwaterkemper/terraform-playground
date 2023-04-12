module "iam-rotation-key" {
    source = "./modules/iam-keys-rotation"
}

module "yaml-merge" {
    source = "./modules/yaml"
}

resource "local_file" "otherfile" {
    filename = "./otherfile.txt"
    content = module.yaml-merge.merged.textconten
}