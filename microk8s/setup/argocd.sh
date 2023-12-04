microk8s enable dns rbac storage
microk8s kubectl create namespace argocd
microk8s kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
microk8s kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
microk8s enable calico
microk8s kubectl apply -f microk8s/argocd-network-policy.yaml
microk8s kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo
