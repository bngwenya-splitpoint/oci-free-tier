# Important Debug Commands
Restart Pods - kubectl delete pod -l app=mivu-gui-fe
Get Pod Details - kubectl describe pod mivu-gui-fe-76f8bdc75-tsr49
Check Ingress - kubectl get ingress -A
Get status of all pods - kubectl get pods -A

# Scale down Pods
oci ce node-pool list --cluster-id <your-cluster-id>
oci ce node-pool update --node-pool-id <pool-id> --size 0
or N vaigate in console


# Create OCIR Secret
kubectl create secret docker-registry ocir-secret \
  --docker-server=af-johannesburg-1.ocir.io \
  --docker-username="axuvz4vqgovi/boitumelok.ngwenya@gmail.com" \
  --docker-password=")6vLpqu)w{tqoi7<Ne3F" \
  --docker-email="boitumelok.ngwenya@gmail.com"

# KUBERCONFIG
oci ce cluster create-kubeconfig \
  --cluster-id ocid1.cluster.oc1.af-johannesburg-1.aaaaaaaahthftb3do6mxiarrglh5ya365a5km4ivlkls244yzcqxrithjmbq \
  --region af-johannesburg-1 \
  --file $HOME/.kube/config \
  --overwrite

# HELM
  $ helm install traefik traefik/traefik \
    --namespace ingress-traefik --create-namespace \
    --set ingressClass.enabled=true \
    --set ingressClass.isDefaultClass=true \
    --set ports.web.exposedPort=80 \
    --set ports.websecure.exposedPort=443 \
    --set service.type=LoadBalancer \
    --set logs.general.level=INFO

# Build Tag and Push Image
docker build -t af-johannesburg-1.ocir.io/axuvz4vqgovi/mivu/mivu-gui-fe:latest .
docker push af-johannesburg-1.ocir.io/axuvz4vqgovi/mivu/mivu-gui-fe:latest

# Different Way of Doing It
docker tag mivu-gui-fe af-johannesburg-1.ocir.io/axuvz4vqgovi/mivu/mivu-gui-fe:latest
docker login af-johannesburg-1.ocir.io
Username: axuvz4vqgovi/boitumelok.ngwenya@gmail.com
)6vLpqu)w{tqoi7<Ne3F
docker push af-johannesburg-1.ocir.io/axuvz4vqgovi/mivu/mivu-gui-fe:latest



# Restart Deployment
kubectl rollout restart deployment mivu-gui-fe


# CHECK SERVICES AND PODS

  $ kubectl get pods -n ingress-traefik
  NAME                       READY   STATUS    RESTARTS   AGE
  traefik-6895455796-6t7x2   1/1     Running   0          64s

  $ kubectl get svc -n ingress-traefik
  NAME      TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)                      AGE
  traefik   LoadBalancer   10.96.139.207   84.8.141.173   80:30107/TCP,443:32675/TCP   2m45s


  $ kubectl get ingress
  NAME                  CLASS    HOSTS        ADDRESS        PORTS     AGE
  mivu-gui-fe-ingress   <none>   mivu.local   84.8.141.173   80, 443   6d21h


kubectl get svc -n ingress-nginx

## REDEPLOYMENT STEPS ##
# 1 a Install OCI Terminal
# 1
kubectl config current-context
kubectl get nodes
# KUBERCONFIG
oci ce cluster create-kubeconfig \
  --cluster-id ocid1.cluster.oc1.af-johannesburg-1.aaaaaaaahthftb3do6mxiarrglh5ya365a5km4ivlkls244yzcqxrithjmbq \
  --region af-johannesburg-1 \
  --file $HOME/.kube/config \
  --overwrite

## Prod Approach ## 

helm install traefik traefik/traefik \
  --namespace ingress-traefik \
  --create-namespace \
  -f traefik-values.yaml


# Update Node Pool - Node Pool Update
oci ce node-pool update \
  --node-pool-id ocid1.nodepool.oc1.af-johannesburg-1.aaaaaaaaefm4p7pkty7wdee4d2li5twhsfyutmw7xxnlmirzonspkaojowiq \
  --quantity-per-subnet 2 \
  --force