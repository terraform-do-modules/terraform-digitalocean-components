# Terraform Digital Ocean component

This digital Ocean Component repo is a collection of different modules that were created at the same time.

By default this creates many digital ocean component listed in moudle directory.

Here is Digital Ocean Cloud Component created using this repo. 

|COMPONENT           |PATH  | OFFICAL-URL|
|:-------------------|:-----|:---------|
|VPC|[terraform/_modules/vpc](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/vpc)|[terraform-digitalocean-vpc](https://github.com/terraform-do-modules/terraform-digitalocean-vpc)|
|DROPLET|[terraform/_modules/droplet](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/droplet)|[terraform-digitalocean-droplet](https://github.com/terraform-do-modules/terraform-digitalocean-droplet)|
|CDN|[terraform/_modules/cdn](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/cdn)|[terraform-digitalocean-cdn](https://github.com/terraform-do-modules/terraform-digitalocean-cdn)|
|CERTIFICATE|[terraform/_modules/certificate](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/certificate)|[terraform-digitalocean-certificate](https://github.com/terraform-do-modules/terraform-digitalocean-certificate)|
|DATABASE|[terraform/_modules/database](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/database)|[terraform-digitalocean-database](https://github.com/terraform-do-modules/terraform-digitalocean-database)|
|DOMAIN|[terraform/_modules/doamin](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/domain)|[terraform-digitalocean-domain](https://github.com/terraform-do-modules/terraform-digitalocean-domain)|
|SPACES|[terraform/_modules/spaces](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/spaces)|[terraform-digitalocean-spaces](https://github.com/terraform-do-modules/terraform-digitalocean-spaces)|
|KUBERNETES|[terraform/_modules/kubernetes](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/kubernetes)|[terraform-digitalocean-kubernetes](https://github.com/terraform-do-modules/terraform-digitalocean-kubernetes)|
|CONTAINER-REGISTRY|[terraform/_modules/container-registry](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/container-registry)|[terraform-digitalocean-container-registry](https://github.com/terraform-do-modules/terraform-digitalocean-container-registry)|
|FIREWALL|[terraform/_modules/firewall](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/firewall)|[terraform-digitalocean-firewall](https://github.com/terraform-do-modules/terraform-digitalocean-firewall)|
|MONITORING|[terraform/_modules/monitoring](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/monitoring)|[terraform-digitalocean-monitoring](https://github.com/terraform-do-modules/terraform-digitalocean-monitoring)|
|LOADBALANCER|[terraform/_modules/loadbalancer](https://github.com/terraform-do-modules/terraform-digitalocean-components/tree/master/terraform/_modules/loadbalancer)|[terraform-digitalocean-loadbalancer](https://github.com/terraform-do-modules/terraform-digitalocean-loadbalancer)|


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