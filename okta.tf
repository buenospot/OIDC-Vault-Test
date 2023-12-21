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
  primary_phone      = "4445556661"
  state              = "CA"
  street_address     = "1234 Testing St."
  timezone           = "America/Los_Angeles"
  title              = "Director"
  user_type          = "Employee"
  zip_code           = "90814"
}

resource "okta_user" "Bernie_Pops" {
  first_name         = "Bernie"
  last_name          = "Pops"
  login              = "berniepops@lbpopsco.com"
  password           = "bernie1s7he8est"
  email              = "buenospot+bernie@berkeley.edu"
  city               = "Long Beach"
  country_code       = "US"
  department         = "IT"
  display_name       = "Bernie Pops"
  employee_number    = "111112"
  locale             = "en_US"
  nick_name          = "Bernie"
  organization       = "Long Beach Pops Co"
  postal_address     = "1234 Testing St."
  preferred_language = "en-us"
  primary_phone      = "4445556662"
  state              = "CA"
  street_address     = "1234 Testing St."
  timezone           = "America/Los_Angeles"
  title              = "QA Engineer"
  user_type          = "Employee"
  zip_code           = "90814"
}
resource "okta_user" "Lily_Pops" {
  first_name         = "Lily"
  last_name          = "Pops"
  login              = "lilypops@lbpopsco.com"
  password           = "lily1s7he8est"
  email              = "buenospot+lily@berkeley.edu"
  city               = "Long Beach"
  country_code       = "US"
  department         = "IT"
  display_name       = "Lily Pops"
  employee_number    = "111113"
  locale             = "en_US"
  nick_name          = "Lily"
  organization       = "Long Beach Pops Co"
  postal_address     = "1234 Testing St."
  preferred_language = "en-us"
  primary_phone      = "4445556663"
  state              = "CA"
  street_address     = "1234 Testing St."
  timezone           = "America/Los_Angeles"
  title              = "Software Engineer"
  user_type          = "Employee"
  zip_code           = "90814"
}
resource "okta_user" "Audrey_Pops" {
  first_name         = "Audrey"
  last_name          = "Pops"
  login              = "audreypops@lbpopsco.com"
  password           = "audrey1s7he8est"
  email              = "buenospot+audrey@berkeley.edu"
  city               = "Long Beach"
  country_code       = "US"
  department         = "IT"
  display_name       = "Audrey Pops"
  employee_number    = "111114"
  locale             = "en_US"
  nick_name          = "Stella"
  organization       = "Long Beach Pops Co"
  postal_address     = "1234 Testing St."
  preferred_language = "en-us"
  primary_phone      = "4445556664"
  state              = "CA"
  street_address     = "1234 Testing St."
  timezone           = "America/Los_Angeles"
  title              = "Software Engineer"
  user_type          = "Employee"
  zip_code           = "90814"
}
