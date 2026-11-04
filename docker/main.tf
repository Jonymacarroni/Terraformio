provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_network" "practica11" {
  name = "practica11-network"
}

resource "docker_container" "nginx" {
  name  = "practica11-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8000
  }

  networks_advanced {
    name = docker_network.practica11.name
  }
}