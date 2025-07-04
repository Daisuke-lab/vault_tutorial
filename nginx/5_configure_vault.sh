# Write a HCL for policy
cat <<EOF > /home/vault/nginx-policy.hcl
path "kv2/data/nginx" {
  capabilities = ["read"]
}
EOF

# Generate a policy
vault policy write nginx-policy /home/vault/nginx-policy.hcl

# Create a role
vault write auth/kubernetes/role/vault-role \
   bound_service_account_names=vault-serviceaccount \
   bound_service_account_namespaces=vault \
   policies=nginx-policy \
   ttl=1h

# Create a config
vault write auth/kubernetes/config \
   token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
   kubernetes_host=https://${KUBERNETES_PORT_443_TCP_ADDR}:443 \
   kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
