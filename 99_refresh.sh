helm uninstall vault -n vault
kubectl delete pvc -n vault --all
kubectl delete pv --all
helm install vault hashicorp/vault  -n vault --create-namespace