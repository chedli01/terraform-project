terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

resource "local_file" "myfile" {
  content  = "hello this is my file but second version"
  filename = "${path.module}/myfile.txt"
} 