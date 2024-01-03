/**
 * These variables will be used to connect to and then configure Okta using the Okta
 * Terraform provider. Recall that you must have already set up an App inside of your
 * Okta developer account in order to make the connection.
 */

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
  description = "This is an App client ID and this one is used for Terraform to connect to Okta so that Terraform can control Okta."
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


variable "okta_vault_app_name" {
  type = string
}
variable "okta_vault_app_addr" {
  type = string
}

variable "okta_vault_app_callback_uri_ui" {
  type = string
}

variable "okta_vault_app_callback_uri_cli" {
  type = string
}