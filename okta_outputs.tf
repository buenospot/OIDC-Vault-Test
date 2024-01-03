
output "my_full_org_name" {
  value = local.full_org_name
}
output "my_okta_app_client_id" {
  value = okta_app_oauth.okta_vault_app.client_id
}
output "my_okta_app_client_secret" {
  value = okta_app_oauth.okta_vault_app.client_secret
  sensitive = true
}