# Module Inputs & Outputs

This document covers the inputs and outputs for each module under `terraform/_modules/`.

---

## VPC (`terraform/_modules/vpc/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| region | The region to create the VPC, like `blr1`. | `string` | `"blr1"` | no |
| ip\_range | The IP CIDR range for the VPC. Cannot overlap with other networks; must be in RFC1918 range and between /16 and /24. | `string` | `""` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the VPC. |

---

## Droplet (`terraform/_modules/droplet/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| region | The region to create the Droplet, like `blr1`. | `string` | `"blr1"` | no |
| enabled | Whether to create the resources. Set to `false` to prevent resource creation. | `bool` | `true` | no |
| vpc\_id | The ID of the VPC where the Droplet will be located. | `string` | `""` | no |
| ssh\_keys | Map of SSH key objects with `name` and `public_key` attributes. | `map(object)` | `{}` | no |
| inbound\_rules | List of objects representing inbound firewall rule configurations. | `any` | `[]` | no |
| user\_data | A string of the desired User Data for the Droplet. | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| name | The name of the Droplet. |
| id | The ID of the Droplet. |

---

## Database (`terraform/_modules/database/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| enabled | Flag to control resource creation. | `bool` | `true` | no |
| cluster\_engine | Database engine: `pg`, `mysql`, `redis`, or `mongodb`. | `string` | `""` | yes |
| cluster\_version | The version of the database cluster. | `string` | `""` | yes |
| cluster\_size | Droplet size for the cluster (e.g. `db-s-1vcpu-1gb`). | `string` | `"db-s-1vcpu-1gb"` | no |
| region | DigitalOcean region where the cluster will reside. | `string` | `null` | no |
| cluster\_node\_count | Number of nodes in the cluster. | `number` | `1` | no |
| cluster\_private\_network\_uuid | The ID of the VPC where the cluster will be located. | `string` | `null` | no |
| mysql\_sql\_mode | Comma-separated SQL modes for a MySQL cluster. | `string` | `null` | no |
| cluster\_maintenance | Day and start hour of the maintenance window policy. | `map(string)` | `null` | no |
| databases | A list of databases in the cluster. | `list(string)` | `[]` | no |
| users | A list of users in the cluster. | `list(map(string))` | `null` | no |
| create\_firewall | Controls if a firewall should be created. | `bool` | `false` | no |
| firewall\_rules | List of firewall rules associated with the cluster. | `list(map(string))` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| database\_cluster\_id | The ID of the database cluster. |
| database\_cluster\_urn | The URN of the database cluster. |
| database\_cluster\_host | The hostname of the database cluster. |
| database\_cluster\_private\_host | Private hostname (accessible within the account/region). |
| database\_cluster\_uri | The full URI for connecting to the cluster. (sensitive) |
| database\_cluster\_default\_database | Name of the cluster's default database. |
| database\_cluster\_default\_user | Username for the cluster's default user. |
| database\_cluster\_default\_password | Password for the cluster's default user. (sensitive) |
| connection\_pool\_id | The ID of the database connection pool. |
| connection\_pool\_host | Hostname for the connection pool. |
| connection\_pool\_private\_host | Private hostname for the connection pool. |
| connection\_pool\_port | Port the connection pool is listening on. |
| connection\_pool\_uri | Full URI for the connection pool. (sensitive) |
| connection\_pool\_private\_uri | Private URI for the connection pool. (sensitive) |
| connection\_pool\_password | Password for the connection pool user. (sensitive) |
| db\_name | The name of the database. |
| user\_role | Role for the database user. |
| user\_password | Password for the database user. (sensitive) |
| database\_firewall\_id | Unique identifier for the firewall. |
| database\_firewall\_rule | Map with rule uuid, type, value, and created\_at. |
| database\_replica\_firewall\_rule | Map with replica rule uuid, type, value, and created\_at. |
| replica\_id | The ID of the database replica. |
| replica\_host\_name | The hostname of the database replica. |
| replica\_cluster\_private\_host | Private hostname for the replica. |
| replica\_cluster\_port | Port the replica is listening on. |
| replica\_cluster\_uri | Full URI for the replica. (sensitive) |
| replica\_cluster\_default\_database | Default database name on the replica. |
| replica\_cluster\_default\_user | Default username on the replica. |
| replica\_cluster\_default\_password | Default password on the replica. (sensitive) |

---

## Kubernetes (`terraform/_modules/kubernetes/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| enabled | Whether to create the resources. | `bool` | `true` | no |
| region | Kubernetes cluster region. | `string` | `"blr1"` | no |
| cluster\_version | Kubernetes version (e.g. `1.27.2`). | `string` | `"1.27.2"` | no |
| vpc\_uuid | The ID of the VPC where the cluster will be located. | `string` | `""` | no |
| critical\_node\_pool | Default (critical) node pool configuration. | `any` | `{}` | no |
| app\_node\_pools | Additional node pool configurations. | `map(any)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Kubernetes cluster. |
| endpoint | The base URL of the Kubernetes API server. |

---

## Monitoring (`terraform/_modules/monitoring/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| enabled | Whether the uptime check is enabled. | `bool` | `true` | no |
| target\_url | List of endpoints to perform health checks on. | `list(any)` | `[]` | no |
| type | Health check type: `ping`, `http`, or `https`. | `list(string)` | `[]` | no |
| alert\_type | Alert type: `latency`, `down`, `down_global`, or `ssl_expiry`. | `list(any)` | `["down_global"]` | no |
| comparison | Comparison operator: `greater_than` or `less_than`. | `list(any)` | `["less_than"]` | no |
| period | Threshold period: `2m`, `3m`, `5m`, `10m`, `15m`, `30m`, or `1h`. | `list(string)` | `["2m"]` | no |
| notifications | Notification settings for alert triggers. | `list(any)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| uptime\_check\_id | The ID of the uptime check. |
| uptime\_alert\_id | The ID of the uptime alert. |
| uuid | The UUID of the alert. |

---

## CDN (`terraform/_modules/cdn/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Whether to create the resources. | `bool` | `true` | no |
| origin | The FQDN of the origin Space. | `string` | `""` | yes |
| ttl | TTL for the CDN endpoint in seconds. | `number` | `3600` | no |
| certificate\_name | Name of the DigitalOcean TLS certificate for custom subdomains. | `string` | `null` | no |
| custom\_domain | FQDN of the custom subdomain for the CDN endpoint. | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the CDN endpoint. |

---

## Certificate (`terraform/_modules/certificate/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Flag to control resource creation. | `bool` | `true` | no |
| certificate\_name | The name of the certificate. | `string` | `""` | yes |
| domain\_names | List of FQDNs for the Let's Encrypt certificate. Domains must be managed by DigitalOcean DNS. | `list(any)` | `[]` | yes |

### Outputs

| Name | Description |
|------|-------------|
| id | The unique ID of the certificate. |
| name | The name of the certificate. |

---

## Container Registry (`terraform/_modules/container-registry/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`, `application`. | `list(any)` | `["name","environment"]` | no |
| subscription\_tier\_slug | Subscription tier: `starter`, `basic`, or `professional`. | `string` | `"starter"` | no |
| region | The region for the registry (e.g. `syd1`). | `string` | `"syd1"` | no |
| enabled | Whether to create the resources. | `bool` | `true` | no |

### Outputs

| Name | Description |
|------|-------------|
| name | The name of the container registry. |

---

## Domain (`terraform/_modules/domain/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the domain. | `string` | `""` | yes |
| enabled | Whether to create the resources. | `bool` | `true` | no |
| records | Map of DigitalOcean DNS record resources. | `map(any)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the domain. |

---

## Firewall (`terraform/_modules/firewall/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`, `application`. | `list(any)` | `["name","environment"]` | no |
| enabled | Flag to control firewall creation. | `bool` | `true` | no |
| allowed\_ip | List of allowed IP addresses. | `list(any)` | `[]` | no |
| allowed\_ports | List of allowed ingress ports. | `list(any)` | `[]` | no |
| droplet\_ids | List of Droplet IDs to attach to the firewall. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| name | The name of the firewall. |

---

## Load Balancer (`terraform/_modules/loadbalancer/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| region | The region for the load balancer. | `string` | `"blr-1"` | no |
| enabled | Whether to create the resources. | `bool` | `true` | no |
| vpc\_uuid | The ID of the VPC where the load balancer will be located. | `string` | `""` | no |
| droplet\_ids | List of Droplet IDs to attach to the load balancer. | `list(string)` | `[]` | no |
| enabled\_redirect\_http\_to\_https | Redirect HTTP on port 80 to HTTPS on port 443. | `bool` | `false` | no |
| forwarding\_rule | List of forwarding rule configuration objects. | `list(any)` | `[]` | no |
| healthcheck | List of healthcheck configuration objects. | `list(any)` | `[]` | no |
| sticky\_sessions | List of sticky session configuration objects. | `list(any)` | `[]` | no |
| firewall | List of load balancer firewall configuration objects. | `list(any)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the load balancer. |

---

## Spaces (`terraform/_modules/spaces/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| region | The region for the Spaces bucket, like `blr1`. | `string` | `"blr1"` | no |
| acl | Canned ACL applied on bucket creation: `private` or `public-read`. | `string` | `null` | no |
| force\_destroy | If true, destroy bucket even if not empty. | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| urn | The URN of the Spaces bucket. |
| name | The name of the Spaces bucket. |
| bucket\_domain\_name | The domain name of the Spaces bucket. |

---

## App (`terraform/_modules/app/`)

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Flag to control resource creation. | `bool` | `true` | no |
| spec | A DigitalOcean App spec describing the app. | `any` | `[]` | yes |

### Outputs

None defined at the component wrapper level.
