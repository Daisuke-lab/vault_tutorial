# Write a HCL for policy
cat <<EOF > /home/vault/hoge-policy.hcl
path "kv2/data/hoge" {
  capabilities = ["read"]
}
EOF

# Generate a policy
vault policy write hoge-policy /home/vault/hoge-policy.hcl

# Create a role
vault write auth/kubernetes/role/hoge-role \
   bound_service_account_names=vault-serviceaccount \
   bound_service_account_namespaces=vault \
   policies=hoge-policy \
   ttl=1h

# Create a config
vault write auth/kubernetes/config \
   token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
   kubernetes_host=https://${KUBERNETES_PORT_443_TCP_ADDR}:443 \
   kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
