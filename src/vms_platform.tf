
# Зоны доступности 
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone_d" {
  type        = string
  default     = "ru-central1-d"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

# Сеть
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "d_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-key"
  description = "ssh-keygen -t ed25519"
  sensitive   = true
}*/

# Мои изменения 
# Образ
variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS image"
}
#ВМ_Web
variable "vm_web_name" {
  type        = string
  default     = "platform-web"
  description = "Name of the compute instance"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "The type of virtual machine to create"
}
/*
variable "vm_web_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  description = "Compute resources for the web instance"
}*/

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Is the virtual machine preemptible?"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Enable NAT for the network interface"
}

#ВМ_DB
variable "vm_db_name" {
  type        = string
  default     = "platform-db"
  description = "Name of the compute instance"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "The type of virtual machine to create"
}
/*
variable "vm_db_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  description = "Compute resources for the web instance"
}*/

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Is the virtual machine preemptible?"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Enable NAT for the network interface"
}

# Переменные для locals 
# Окружение
variable "company_name" {
  type    = string
  default = "netology"
}
variable "env" {
  type    = string
  default = "develop"
}
#map
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  description = "Ресурсы ВМ (cores, memory, core_fraction) для каждой машины"
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "vms_metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys           = string
  }))
  sensitive   = true
  description = "Общие metadata для всех ВМ: serial-port-enable и ssh-keys"
  default = {
    common = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-ed25519 MyKEY user@host"
    }
  }
}