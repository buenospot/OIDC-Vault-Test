# OIDC Vault Test Repo

Using this repo to test Okta OIDC Vault behavior. Specifically, I want to test what happens when you set up Vault to use OIDC with an Okta backend and what the Vault behavior is. What I would like to happen is:

### Okta Group <-> Vault External Group

And when you log in to Vault with *OIDC username/password* that it will return back Okta Group Memberships which will have the correct mapping to Vault external groups and therefore posses a token that inherits all the policies for the external groups that the user belongs to.

For this repo to function correctly, you will need an Okta Developer Account so set one of those up here:
developer.okta.com

Once you have that set up, you will then need to set up an API integration so that you can manage Okta from Terraform. Okta recommends that you use OAuth 2.0 for this machine-to-machine workflow. They describe the process of set up for this.

- [Setting up access inside of Okta so that Terraform can access your org] [1]
- [This is the information for scoped OAuth 2.0 tokens] [2]
[1]: https://developer.okta.com/docs/guides/terraform-enable-org-access/main/ 
[2]: https://developer.okta.com/docs/guides/implement-oauth-for-okta-serviceapp/main/

Then, using terraform, you will set up a structure of the org below
Long Beach Custom Popsicles

lbpopsco.com

Group Name: okta-admins
Stella Pops
Bernie Pops

Group Name: okta-developers
Lily Pops
Audrey Pops
Stella Pops

Group Name: okta-qas
Bernie Pops



Will need HCP Vault
