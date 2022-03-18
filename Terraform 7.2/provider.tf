terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id                 = "b1gqfhsrfr2406ivc4tu"
  folder_id                = "b1g7k2tcvafuvkk7egek"
  zone                     = "ru-central1-a"
}
