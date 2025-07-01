# Run it on your node
kubectl exec -it vault-0 -n vault -- /bin/sh

# Initialize Vault
vault operator init
vault operator unseal
vault login
