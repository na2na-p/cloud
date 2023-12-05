microk8s enable dns
microk8s enable rbac
microk8s enable hostpath-storage
microk8s kubectl create namespace argocd
microk8s kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
microk8s kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
microk8s enable calico
microk8s kubectl apply -f microk8s/argocd-network-policy.yaml
microk8s kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo
microk8s kubectl patch svc argocd-server -n argocd --type='json' -p '[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":32455}]'
