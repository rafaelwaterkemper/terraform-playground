data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "waterkemper-mybucket"
    key    = "remote/state.tfstate"
    region = "sa-east-1"
  }
}