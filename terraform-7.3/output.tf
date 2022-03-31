output "ip_nat_for_each" {
  value = toset([
    for platform_id in yandex_compute_instance.vm_for_each : platform_id.network_interface.0.nat_ip_address
  ])
}

output "ip_nat_for_count" {
  value = [
    for platform_id in yandex_compute_instance.vm : platform_id.network_interface.0.nat_ip_address
  ]
}

