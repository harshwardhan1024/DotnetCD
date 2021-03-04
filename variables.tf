variable "branch_name" {
	description = "Name of the branch that's being deployed"
}

variable "app_service_plan_sku" {
	type = object({
		tier = string
		size = string
	})

	description = "App Service Plan's SKU"
}

variable "app_service_site_config_use_32_bit_worker_process" {
	type = bool
	description = "App Service's site config to use 32 bit worker process or not"
}