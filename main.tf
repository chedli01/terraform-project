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
  content  = var.content
  filename = "${path.module}/myfile.txt"
} 