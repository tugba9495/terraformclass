### Digital Ocean ###
variable "region_for_droplet" {
  type    = string
  default = "nyc1"
}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "do_token" {
  type    = string
  default = ""
}

### AWS ###
variable "aws_secret_key" {
  default = ""
}

variable "aws_access_key" {
  default = ""
}