Using this repo to test Okta OIDC Vault behavior. Specifically, I want to test what happens when you set up Vault to use OIDC with an Okta backend and what the Vault behavior is. What I would like to happen is:

Okta Group <-> Vault External Group

And when you log in to Vault with standard username/password through OIDC that it will return back Okta Group Memberships which will have the correct mapping to Vault external groups and therefore posses a token that inherits all the policies for the external groups that the user belongs to.

You will need an Okta Developer Account.

Once you have that set up, you will then need to set up an API integration so that you can manage Okta from Terraform.


Then, using terraform, you will set up a structure of the org below
Long Beach Custom Popsicles

lbpopsco.com

Admins
Stella Pops
Bernie Pops

Developers
Lily Pops
Audrey Pops
Stella Pops

QA
Bernie Pops



Will need HCP Vault
