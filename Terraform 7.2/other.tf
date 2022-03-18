# Образ
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

# Сеть
resource "yandex_vpc_network" "net" {
  name = "net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = "ru-central1-a"
# Идентификатор сети к которой пренадлежит подсеть в данном случае net в переменной "${yandex_vpc_network.default.id}" которая является её id
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["192.168.101.0/24"]
}

#Виртуальная машина
resource "yandex_compute_instance" "vm" {
  name        = "test1"
  hostname    = "test1.local"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 2

  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = "network-hdd"
      size     = "15"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet.id}"
    nat       = true
    ipv6      = false
    ip_address = "192.168.101.11"
 }

  metadata = {
    ssh-keys = "ubuntu:${file("/home/panmonster/.ssh/id_rsa.pub")}"
  }
}
