terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.6.3"
    }
  }
}

/** Configure the Okta Provider
# see okta_variables.tf for the variable declarations
# locally using the okta_variables.tfvars
# Note that the private key cannot be presented as a file in tfvars
# so at the CLI, you will need to do something like:
# terraform plan[apply,destroy] -var"okta_private_key=yourfilepath.key"
*/

provider "okta" {
  org_name       = var.okta_org_name
  base_url       = var.okta_base_url
  client_id      = var.okta_terraform_client_id
  private_key_id = var.okta_private_key_id
  private_key    = var.okta_private_key
  scopes         = var.okta_scopes
}

/** Add the Users
# Recall that there are 4 users for testing purposes here:
# Stella, Lily, Bernie, Audrey
*/


resource "okta_user" "Stella_Pops" {
  first_name         = "Stella"
  last_name          = "Pops"
  login              = "stellapops@lbpopsco.com"
  password           = "stella1s7he8est"
  email              = var.stella_pops_email
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
  email              = var.bernie_pops_email
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
  email              = var.lily_pops_email
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
  email              = var.audrey_pops_email
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


/** Add the Groups & also configure Group Members
# Recall that there are 3 groups for testing purposes here:
# Admins, Developers, QA
*/


resource "okta_group" "okta-pops-admins-vault" {
  name        = "okta-pops-admins-vault"
  description = "This is the group of the Pops Admins."
}

resource "okta_group_memberships" "okta_pops_admins_members" {
  group_id = okta_group.okta-pops-admins-vault.id
  users = [
    okta_user.Stella_Pops.id,
    okta_user.Bernie_Pops.id,
  ]
}

/**
 * Here are the devs
 */

resource "okta_group" "okta-pops-developers-vault" {
  name        = "okta-pops-developers-vault"
  description = "This is the group of the Pops Developers."
}
resource "okta_group_memberships" "okta_pops_developers_members" {
  group_id = okta_group.okta-pops-developers-vault.id
  users = [
    okta_user.Stella_Pops.id,
    okta_user.Lily_Pops.id,
    okta_user.Audrey_Pops.id
  ]
}

/**
 * QA Group
 */

resource "okta_group" "okta-pops-qas-vault" {
  name        = "okta-pops-qas-vault"
  description = "This is the group of the Pops QA Engineers."
}
resource "okta_group_memberships" "okta_pops_qas_members" {
  group_id = okta_group.okta-pops-qas-vault.id
  users = [
    okta_user.Bernie_Pops.id
  ]
}

/**
 * Need to create an authorization server for this exercise
 * Once that's done, need to create a claim
 */

resource "okta_auth_server" "okta_vault_auth_server" {
  audiences   = ["api://okta_vault_auth"]
  description = "Auth server for this OIDC Vault test"
  name        = "okta_vault_auth_server"
  status      = "ACTIVE"
  issuer_mode = "ORG_URL"
}

resource "okta_auth_server_claim" "okta_vault_auth_server_claim" {
  auth_server_id = okta_auth_server.okta_vault_auth_server.id
  name           = "groups"
  value          = "_vault"
  scopes         = ["profile"]
  claim_type = "IDENTITY"
  value_type = "GROUPS"
  group_filter_type = "CONTAINS"
}

/**
 * Need to create the App inside of Okta now
 * This is the Okta side that connects Vault to Okta to authenticate the user
 */

locals {
  full_vault_callback_uri_ui = format("%s%s", var.okta_vault_app_addr, var.okta_vault_app_callback_uri_ui) 
  full_org_name = format("https://%s.%s", var.okta_org_name, var.okta_base_url)
}

resource "okta_app_oauth" "okta_vault_app" {
  label                      = var.okta_vault_app_name
  type                       = "web"
  grant_types                = ["authorization_code", "implicit"]
  redirect_uris              = [local.full_vault_callback_uri_ui,var.okta_vault_app_callback_uri_cli]
  response_types             = ["code", "token","id_token"]
  consent_method = "REQUIRED"
  groups_claim {
    type = "FILTER"
    filter_type = "CONTAINS"
    name = "groups"
    value = "_vault"
  }
}

resource "okta_app_group_assignments" "okta_vault_app_group_assignments" {
  app_id   = okta_app_oauth.okta_vault_app.id
  group {
    id = okta_group.okta-pops-admins_vault.id
  }
  group {
    id = okta_group.okta-pops-developers_vault.id
  }
  group {
    id = okta_group.okta-pops-qas_vault.id
  }
}


resource "okta_app_oauth_api_scope" "okta_vault_app_oauth_api_scope" {
  app_id = okta_app_oauth.okta_vault_app.id
  issuer = local.full_org_name
  scopes = ["okta.groups.read", "okta.users.read.self"]
}

