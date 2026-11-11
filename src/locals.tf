locals {
  vm_web_name_local = "${var.company_name}-${var.env}-${var.vm_web_name}"
  vm_db_name_local  = "${var.company_name}-${var.env}-${var.vm_db_name}"
}