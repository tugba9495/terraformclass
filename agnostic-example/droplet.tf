resource "digitalocean_droplet" "server" {
  provider = digitalocean.do
  image    = data.digitalocean_image.ubuntu_image.id
  name     = "terraform-instance"
  region   = var.region_for_droplet
  size     = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.ssh-key.id]
}