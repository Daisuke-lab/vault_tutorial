# Access pod of Vault
kubectl exec -it vault-0 -n vault -- /bin/sh

# Init and unseal (PLEASE REFER TO THE OTHER SECTION FOR THIS PART)
vault operator init

# Enable Kubernetes Auth
vault auth enable kubernetes

# Enable KV Store
vault secrets enable -path=kv2 kv-v2

# Add a new secret
vault kv put kv2/nginx password=SUPER_SECRET
