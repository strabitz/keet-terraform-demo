module "demo" {
    source = "./modules/demo"
}

provider "aws" {
  profile = default
  region  = var.region
}
