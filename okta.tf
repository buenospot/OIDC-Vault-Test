terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.6.3"
    }
  }
}

# Configure the Okta Provider
# see okta_variables.tf for the variable declarations
# locally using the okta_variables.tfvars

provider "okta" {
  org_name       = var.okta_org_name
  base_url       = var.okta_base_url
  client_id      = var.okta_app_client_id
  private_key_id = var.okta_private_key_id
  private_key    = var.okta_private_key
  scopes         = var.okta_scopes
}

resource "okta_user" "Stella_Pops" {
  first_name         = "Stella"
  last_name          = "Pops"
  login              = "stellapops@lbpopsco.com"
  password           = "stella1s7he8est"
  email              = "buenospot+stella@berkeley.edu"
  city               = "Long Beach"
  country_code       = "US"
  department         = "IT"
  display_name       = "Stella Pops"
  employee_number    = "111111"
  locale             = "en_US"
  nick_name          = "Stella"
  organization       = "Long Beach Pops Co"
  postal_address     = "1234 Testing St."
  preferred_language = "en-us"
  primary_phone      = "4445556666"
  state              = "CA"
  street_address     = "1234 Testing St."
  timezone           = "America/Los_Angeles"
  title              = "Director"
  user_type          = "Employee"
  zip_code           = "90814"
}
