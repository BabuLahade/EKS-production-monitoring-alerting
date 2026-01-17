docker ps
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
free -h
sudo apt install -y apt-transport-https ca-certificates curl
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
kubectl version --client
kubeadm version
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo modprobe br_netfilter
sudo modprobe overlay
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

chmod 400 moniter-alert.pem
clear
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu
newgrp docker
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
ls /proc/sys/net/bridge
cat /proc/sys/net/bridge/bridge-nf-call-iptables
sudo kubeadm reset -f
sudo rm -rf ~/.kube
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
kubectl get nodes
aws --version
kubectl version --client
eksctl version
curl -sLO https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz
tar -xzf eksctl_Linux_amd64.tar.gz
sudo mv eksctl /usr/local/bin/
eksctl version
awscli version
awscli --version
aws --version
aws configure
aws sts get-caller-identity
eksctl create cluster --name monitoring-cluster --region eu-north-1 --nodegroup-name monitoring-ng --node-type t3.small --nodes 2 --nodes-min 2 --nodes-max 3 --managed
aws eks --region eu-north-1 update-kubeconfig --name monitoring-cluster
kubectl get nodes
kubectl get ns
kubectl create namespace monitoring
kubectl get ns
clear
kubectl get nodes
kubectl get ns
vim node-exporter.yml
kubectl apply -f .
kubectl get pods -n monitoring
vim node-exporter-service.yml
kubectl apply -f  node-exporter-service.yml
vim kube-state-metrics.yml
kubectl apply -f kube-state-metrics.yaml
kubectl apply -f kube-state-metrics.yml
vim kube-state-metrics-service.yml
kubectl apply -f kube-state-metrics-service.yml
clear
kubectl get all
kubectl get all -n monitoring
vim prometheus-rbac.yml
kubectl apply -f prometheus-rbac.yml
vim prometheus-config.yml
kubectl apply -f prometheus-config.yml
vim prometheus-deployment.yml
kubectl apply -f prometheus-deployment.yml
vim prometheus-service.yml
kubectl apply -f prometheus-service.yml
kubectl get all -n monitoring
kubectl get pods -n monitoring
kubectl get svc -n monitoring
kubectl get nodes -o wide
clear
vim prometheus-alert-rules.yml
kubectl apply -f prometheus-alert-rules.yml
kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
clear
vim alertmanager-config.yml
clear
ls
vim alertmanager-config.yml
kubectl apply -f alertmanager-config.yml
vim alertmanager-deployment.yml
kubectl apply -f alertmanager-deployment.yml
vim alertmanager-service.yml
kubectl apply -f alertmanager-service.yml
kubectl edit configmap prometheus-config -n monitoring
ls
clear
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
kubectl get svc -n monitoring
kubectl run cpu-test --rm -it --image=busybox -- /bin/sh
kubectl get pods -n monitoring
kubectl get svc -n monitoring
clear
vim grafana-deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
spec:
kubectl apply -f grafana-deployment.yaml
kubectl apply -f grafana-deployment.yml
vim grafana-service.yml
kubectl apply -f grafana-service.yml
kubectl get secret monitoring-grafana -n monitoring -o jsonpath="{.data.admin-password}" | base64 -d
ls
kubectl run cpu-test --rm -it --image=busybox -- /bin/sh
while true; do :; done
kubectl get pods
100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[2m])) * 100)
kubectl delete pod cpu-test
kubectl run cpu-test --rm -it --image=busybox -- /bin/sh
kubectl get pods
kubectl get pods -l app=node-exporter
kubectl logs -l app=prometheus
kubectl logs -l app=alertmanager
kubectl get pods -n monitoring
kubectl get pods -l app=node-exporter -n monitoring
kubectl logs -l app=prometheus -n monitoring
kubectl logs -l app=alertmanager -n monitoring
clear
ssh ubuntu@13.60.190.138
yes > /dev/null &
kubectl create configmap prometheus-alert-rules   --from-file=prometheus-alert-rules.yml   -n monitoring
kubectl get configmap prometheus-alert-rules -n monitoring
kubectl edit deployment prometheus -n monitoring
cay prometheus.yml
cat prometheus.yml
cat prometheus-config.yml
vim  prometheus-config.yml
kubectl get configmap -n monitoring
kubectl describe configmap prometheus-alert-rules -n monitoring
kubectl get deployment prometheus -n monitoring -o yaml | grep rule
kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
kubectl get deployment prometheus -n monitoring
kubectl logs -n monitoring prometheus-58d4b5d468-5hcpj
kubectl exec -n monitoring prometheus-58d4b5d468-5hcpj -- ls /etc/prometheus
clear
kubectl exec -n monitoring prometheus-58d4b5d468-5hcpj -- ls /etc/prometheus/rules
kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
kubectl exec -n monitoring prometheus-58d4b5d468-5hcpj -- ls /etc/prometheus/rules
kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
kubectl logs -n monitoring prometheus-xxxxx | grep rule
ls
prometheus-deployment.yml
vim prometheus-deployment.yml
clear
kubectl logs -n monitoring prometheus --previous
kubectl get pods -n monitoring
kubectl logs -n monitoring prometheus-6d759dd46b-m8qqz --previous
kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
kubectl logs -n monitoring prometheus-xxxxx | grep rule
clear
kubectl delete deployment prometheus -n monitoring
kubectl delete svc prometheus -n monitoring
kubectl get pods -n monitoring
kubectl get configmap -n monitoring
vim prometheus-deployment.yml
kubectl apply -f prometheus-deployment.yml
vim prometheus-service.yml
kubectl apply -f prometheus-service.yml
kubectl get pods -n monitoring
kubectl describe pod prometheus-5687c5847c-gcdsn  -n monitoring
clear
kubectl delete deployment prometheus -n monitoring
kubectl delete svc prometheus -n monitoring
kubectl delete configmap prometheus-config -n monitoring
kubectl delete configmap prometheus-alert-rules -n monitoring
kubectl get pods -n monitoring
kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
  namespace: monitoring
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s

    scrape_configs:
    - job_name: 'prometheus'
      static_configs:
      - targets: ['localhost:9090']
EOF

kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
  namespace: monitoring
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus
  template:
    metadata:
      labels:
        app: prometheus
    spec:
      containers:
      - name: prometheus
        image: prom/prometheus:v2.52.0
        args:
          - "--config.file=/etc/prometheus/prometheus.yml"
        ports:
        - containerPort: 9090
        volumeMounts:
        - name: config
          mountPath: /etc/prometheus
      volumes:
      - name: config
        configMap:
          name: prometheus-config
EOF

kubectl apply -f - <<EOF
apiVersion: v1
kind: Service
metadata:
  name: prometheus
  namespace: monitoring
spec:
  type: NodePort
  selector:
    app: prometheus
  ports:
  - port: 9090
    targetPort: 9090
    nodePort: 30090
EOF

kubectl get pods -n monitoring
kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-alert-rules
  namespace: monitoring
data:
  alerts.yml: |
    groups:
    - name: test-alerts
      rules:
      - alert: AlwaysFiring
        expr: vector(1)
        for: 10s
        labels:
          severity: warning
        annotations:
          summary: "Test alert"
EOF

kubectl patch deployment prometheus -n monitoring --type=json -p='[
  {
    "op": "add",
    "path": "/spec/template/spec/containers/0/args/-",
    "value": "--rules.file=/etc/prometheus/alerts.yml"
  },
  {
    "op": "add",
    "path": "/spec/template/spec/containers/0/volumeMounts/-",
    "value": {
      "name": "rules",
      "mountPath": "/etc/prometheus/alerts.yml",
      "subPath": "alerts.yml"
    }
  },
  {
    "op": "add",
    "path": "/spec/template/spec/volumes/-",
    "value": {
      "name": "rules",
      "configMap": {
        "name": "prometheus-alert-rules"
      }
    }
  }
]'
kubectl get pods -n monitoring
kubectl scale deployment prometheus -n monitoring --replicas=1
kubectl delete pod prometheus-f5f4d7d7d-vtwdq -n monitoring
kubectl get pods -n monitoring
kubectl scale deployment prometheus -n monitoring --replicas=0
kubectl get pods -n monitoring
kubectl scale deployment prometheus -n monitoring --replicas=1
kubectl get pods -n monitoring
clear
kubectl get pods -n monitoring
kubectl delete deployment prometheus -n monitoring --grace-period=0 --force
kubectl delete pod -n monitoring -l app=prometheus --grace-period=0 --force
kubectl delete rs -n monitoring -l app=prometheus
kubectl get all -n monitoring | grep prometheus
$ kubectl get all -n monitoring | grep prometheus
service/prometheus           NodePort    10.100.198.60   <none>        9090:30090/TCP   59m
kubectl get pods -n monitoring | grep prometheus
kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
  namespace: monitoring
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s

    scrape_configs:
    - job_name: 'prometheus'
      static_configs:
      - targets: ['localhost:9090']
EOF

kubectl get configmap -n monitoring | grep prometheus
kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
  namespace: monitoring
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus
  template:
    metadata:
      labels:
        app: prometheus
    spec:
      containers:
      - name: prometheus
        image: prom/prometheus:v2.52.0
        args:
          - "--config.file=/etc/prometheus/prometheus.yml"
        ports:
        - containerPort: 9090
        volumeMounts:
        - name: config
          mountPath: /etc/prometheus/prometheus.yml
          subPath: prometheus.yml
      volumes:
      - name: config
        configMap:
          name: prometheus-config
EOF

kubectl get pods -n monitoring
kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-alert-rules
  namespace: monitoring
data:
  alerts.yml: |
    groups:
    - name: demo
      rules:
      - alert: AlwaysFiring
        expr: vector(1)
        for: 10s
        labels:
          severity: warning
        annotations:
          summary: "Always firing alert for demo"
EOF

kubectl delete deployment prometheus -n monitoring
kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
  namespace: monitoring
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus
  template:
    metadata:
      labels:
        app: prometheus
    spec:
      containers:
      - name: prometheus
        image: prom/prometheus:v2.52.0
        args:
          - "--config.file=/etc/prometheus/prometheus.yml"
          - "--rules.file=/etc/prometheus/alerts.yml"
        ports:
        - containerPort: 9090
        volumeMounts:
        - name: config
          mountPath: /etc/prometheus/prometheus.yml
          subPath: prometheus.yml
        - name: rules
          mountPath: /etc/prometheus/alerts.yml
          subPath: alerts.yml
      volumes:
      - name: config
        configMap:
          name: prometheus-config
      - name: rules
        configMap:
          name: prometheus-alert-rules
EOF

kubectl get pods -n monitoring
kubectl logs -n monitoring prometheus-d9b7fc489-h7gb6 --previous
kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
clear
kubectl edit configmap prometheus-config -n monitoring
kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-alert-rules
  namespace: monitoring
data:
  demo-alerts.yml: |
    groups:
    - name: demo-alerts
      rules:
      - alert: AlwaysFiring
        expr: vector(1)
        for: 10s
        labels:
          severity: warning
        annotations:
          summary: "Always firing demo alert"
EOF

kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
  namespace: monitoring
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s

    rule_files:
      - /etc/prometheus/alerts/*.yml

    scrape_configs:
    - job_name: prometheus
      static_configs:
      - targets: ['localhost:9090']
EOF

kubectl edit deployment prometheus -n monitoring
kubectl rollout restart deployment prometheus -n monitoring
kubectl get pods -n monitoring
kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: crash-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: crash-app
  template:
    metadata:
      labels:
        app: crash-app
    spec:
      containers:
      - name: crash
        image: busybox
        command: ["sh", "-c", "exit 1"]
EOF

kubectl get pods
clear
kubectl get pods
clear
kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: alertmanager-config
  namespace: monitoring
data:
  alertmanager.yml: |
    global:
      resolve_timeout: 5m

    route:
      receiver: default-receiver

    receivers:
    - name: default-receiver
EOF

kubectl describe deployment alertmanager -n monitoring
kubectl rollout restart deployment alertmanager -n monitoring
clear
ls
gitinit
git init
git config --global user.name "Babu Lahade"
git config --global user.email "babulahade@gmail.com"
nano .gitignore
git add .
git status
git commit -m "Initial commit - monitoring stack configs"
git remote add origin https://github.com/BabuLahade/EKS-production-monitoring-alerting.git
git branch -M main
git push -u origin main
ls
git rm -r --cached .aws
nano .gitignore
git add .gitignore
git commit -m "Remove AWS credentials and update gitignore"
git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch .aws" --prune-empty --tag-name-filter cat -- --all
git push origin main --force
clear
rm -rf .git
git init
git branch -M main
cat .gitignore
git add .
git status
nano .gitignore
git rm -r --cached aws
