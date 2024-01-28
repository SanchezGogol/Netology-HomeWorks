output "yandex_compute_instance_info" {
   value = [
    [
    yandex_compute_instance.platform.name,
    [yandex_compute_instance.platform.network_interface[0].nat_ip_address,
    yandex_compute_instance.platform.fqdn]
    ],
    [
    yandex_compute_instance.platform-2.name,
    [yandex_compute_instance.platform-2.network_interface[0].nat_ip_address,
    yandex_compute_instance.platform-2.fqdn]
    ]
   ]
   description = "name. ip. fqdn"
}