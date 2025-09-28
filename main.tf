terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

provider "local" {}
provider "null" {}


resource "local_file" "db_config"{
  filename="${path.module}/db_config.txt"
  content=<<EOT
DB_HOST=localhost
DB_USER=${var.db_user}
DB_PASS=${var.db_pass}
  EOT
}

resource "local_file" "backend"{
  filename="${path.module}/backend_service.txt"
  content="Backend (Node) is connected to db : ${local_file.db_config.filename}"
  depends_on = [local_file.db_config]
}

resource "local_file" "frontend" {
  filename = "${path.module}/frontend_service.txt"
  content  = "Frontend talks to Backend : ${local_file.backend.filename}"
  depends_on = [local_file.backend]

} 

resource "null_resource" "deploy_message" {
  provisioner "local-exec" {
    command = "echo '✅ Fake microservices infra deployed successfully!'"
  }
}