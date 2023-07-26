# reference-architectures

This is our base repo structure to help set up actual client infra as code structure for deploy terraform, ansible and other. 

## How to set up client repo

Through our internal Genie tool we can easily make client repo

```hcl
make wrapper project="client-name"
```
## How to set up terraform github action

For run github action we have to change some values and save secret in repo

- Change profile name in all .sh files in _tools folder, it's an optional
- Save secret 'ROLE_ARN' in repo secret, In this we have to save switch role arn to connect with AWS account

## How to set up ansible github action

For run ansible github action need to add secret in repo

- Save secret 'PEM_KEY' in repo secret, In this we have to save our ssh key to connect to server via ansible

## How to run github action 

For run github action go to Actions tab in github and follow below steps

- Select workflow which you want to execute
- After that choose options and run manually job

**Note:** Please run "Terraform Manual Plan" job first to verify, once verification done after thar run "Terraform Manual Deploy" Job.
