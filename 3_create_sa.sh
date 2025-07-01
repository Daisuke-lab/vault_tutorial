# Write a yaml file for Service Account
cat <<EOF > ./nginx-sa.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: vault-serviceaccount
  namespace: vault
EOF

# Create a service account
kubectl apply -f nginx-sa.yaml
