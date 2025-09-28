variable "content"{
  type    = string
  default = "hello this is chedli and this is the content of my file v2" 
}

variable "db_user" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_pass" {
  description = "Database password"
  type        = string
  sensitive   = true
}
