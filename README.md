### OIDC Vault Test Repo

Using this repo to test Okta OIDC Vault behavior. Specifically, I want to test what happens when you set up Vault to use OIDC with an Okta backend and what the Vault behavior is. What I would like to happen is:

#### Okta Group <-> Vault External Group

And when you log in to Vault with *OIDC username/password* that it will return back Okta Group Memberships which will have the correct mapping to Vault external groups and therefore posses a token that inherits all the policies for the external groups that the user belongs to.

For this repo to function correctly, you will need an Okta Developer Account so set one of those up here:
developer.okta.com

Once you have that set up, you will then need to set up an API integration so that you can manage Okta from Terraform. Okta recommends that you use OAuth 2.0 for this machine-to-machine workflow. They describe the process of set up for this.

- [Setting up access inside of Okta so that Terraform can access your Okta org](https://developer.okta.com/docs/guides/terraform-enable-org-access/main/)
- [Information on the scoped OAuth 2.0 token for machine to machine workflows](https://developer.okta.com/docs/guides/implement-oauth-for-okta-serviceapp/main/)


At this point, finally, you can now start using terraform to set up a structure of the org below.
The fictitious company that I have come up with is Long Beach Popsicles

lbpopsco.com

Group Name: okta-pops-admins
Stella Pops
Bernie Pops

Group Name: okta-pops-developers
Lily Pops
Audrey Pops
Stella Pops

Group Name: okta-pops-qas
Bernie Pops

Here's where the TF stuff is:
- Declared all the okta related variables in okta_variables.tf
- Locally, I'm using a tfvars file, on Terraform Cloud, I'm loading up variables
- okta.tf has all the People & Groups


Will need HCP Vault
