

resource "local_file" "hosts_cfg" { # задействуем ресурс local_file для генерации файла, задаем блоку имя hosts_cfg
  content = templatefile("${path.module}/hosts.tftpl", { # в content помещаем функцию templatefile, она возьмет файл шаблон tftpl и наполнит его данными
    webservers = [ #задаем имя блока webservers, в котором мы укажем ресурсы, которые после передадим в файл шаблон
      for instance in yandex_compute_instance.web[*] : { #в цикле прогуливаемся по инстансу, смотрим какие машины были созданы, получаем их данные и помещаем в переменные
        name = "${instance.name}"
        nat_ip_address = instance.network_interface[0].nat_ip_address
        fqdn = instance.fqdn
      }
    ], 
    databases = [
      for instance in yandex_compute_instance.db : {
        name = "${instance.name}"
        nat_ip_address = instance.network_interface[0].nat_ip_address
        fqdn = instance.fqdn
      }
    ],
    storage = [
      for instance in yandex_compute_instance.storage[*] : {
        name = "${instance.name}"
        nat_ip_address = instance.network_interface[0].nat_ip_address
        fqdn = instance.fqdn
      }
    ]
  })
  filename = "${abspath(path.module)}/hosts.cfg" #место, куда сохраняем файл
  }