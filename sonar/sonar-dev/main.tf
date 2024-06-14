terraform {
  backend "azurerm" {}
}
provider "azurerm" {
    subscription_id = ""
    features {}
    skip_provider_registration = "true  "
}
module "sonar-vm"{
    source = "git:https://gangadharans@dev.azure.com/gangadharans/sgmsdn_infra_automation/_git/tf-modules//linux-vm?ref=v0.1"
    vm_name = "sonar-vm"
    resource_group_name = "devops-rg"
    location = "eastus"
    vm_size = "Standard_B1ms"
    admin_username = "devOps_vm_admin"
    //admin_password = "XXXXXXXXXXXXXXX"
    ssh_key_value = file("./ssh_key4_vm")
    //include the resource id from Azure portal
    //subnet_id = "${module.sgmsdn-infra-automation-network.public_subnets[0]}"
    //network_interface_ids = [var.network_interface_id]
}
