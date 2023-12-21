variable "okta_org_name" {
  description = "The org name for the Okta account you are using"
  type = string
  sensitive = false
}

variable "okta_base_url" {
  description = "Base URL for the Okta org eg., [okta.com|oktapreview.com] "
  type = string
  sensitive = false
}

variable "okta_terraform_client_id" {
  description = "App client ID"
  type = string
  sensitive = true
}

variable "okta_private_key_id" {
  description = "Private Key ID"
  type = string
  sensitive = true
}
variable "okta_private_key" {
  description = "Private Key"
  sensitive = true
}
variable "okta_scopes" {
  description = "Comma separated values of scopes"
  sensitive = false
  type = list(string)
}
