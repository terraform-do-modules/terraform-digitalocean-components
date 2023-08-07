# Terraform Digital Ocean component

This digital Ocean Component repo is a collection of different modules that were created at the same time.

By default this creates many digital ocean component listed in moudle directory.

Here is Digital Ocean Cloud Component created using this repo. 

- [VPC](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/vpc) 
- [DROPLET](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/droplet)
- [CDN](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/cdn)
- [CERTIFICATE](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/certificate)
- [DATABASE](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/database)
- [DOMAIN](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/doamin)
- [DROPLET](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/droplet)
- [SPACES](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/spaces)
- [KUBERNETES](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/kubernetes)
- [CONTAINER-REGISTRY](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/container-registry)
- [FIREWALL](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/firewall)
- [MONITORING](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/monitoring)
- [LOADBALANCER](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/loadbalancer)

## To execute
- follow this directory path
```
cd terraform/sandbox/blr1
```
### Initialize terraform configuration:-
The terraform init command initializes a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control.

Initialize Terraform with the necessary configurations using the following command:
```
terraform init 
```

### Plan :-
The terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure. By default, when Terraform creates a plan it: Reads the current state of any already-existing remote objects to make sure that the Terraform state is up-to-date.

Generate a Terraform execution plan configuration using the following command:
```
terraform plan
```
### Apply :-
The terraform apply command performs a plan just like terraform plan does, but then actually carries out the planned changes to each resource using the relevant infrastructure provider's API. It asks for confirmation from the user before making any changes, unless it was explicitly told to skip approval.

Apply the configuration using the following command:
```
teraform apply
```
### Destroy :-
The terraform destroy command terminates resources managed by your Terraform project. This command is the inverse of terraform apply in that it terminates all the resources specified in your Terraform state. It does not destroy resources running elsewhere that are not managed by the current Terraform project.

To destroy the infrastructure, use the following command:
```
terraform destroy
```

## Enable/Disable 
Any module may be prevented from being created. Just add an enabled variable and set its value to false in the moudle. 