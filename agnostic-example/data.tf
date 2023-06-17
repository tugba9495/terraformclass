data "digitalocean_image" "ubuntu_image" {
  provider = digitalocean.do
  slug     = "ubuntu-18-04-x64"
}

data "digitalocean_ssh_key" "ssh-key" {
  provider = digitalocean.do
  name     = "key_name"
}