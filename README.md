# DevOps-Enabled Monitoring & Alerting on AWS EKS

## 📌 Project Overview

This project demonstrates a **production-grade monitoring and alerting system** built on **AWS EKS** using **Prometheus, Alertmanager, and Grafana**. The goal is to provide full observability into Kubernetes clusters, detect failures proactively, and visualize system health in real time.

This project is designed with a **real-world DevOps mindset**, following industry best practices such as namespace isolation, RBAC, alerting rules, and failure simulation.

---

## 🏗️ Architecture

```
AWS EKS Cluster
 ├── Worker Nodes (EC2)
 │    ├── Node Exporter (DaemonSet)
 │    └── Application Pods
 │
 ├── kube-state-metrics
 │
 ├── Prometheus
 │    ├── Scrapes cluster & node metrics
 │    └── Evaluates alert rules
 │
 ├── Alertmanager
 │    └── Handles alerts & notifications
 │
 └── Grafana
      └── Dashboards & visual alerts
```

---

## 🛠️ Tech Stack

* **Cloud**: AWS
* **Kubernetes**: Amazon EKS
* **Monitoring**: Prometheus
* **Alerting**: Alertmanager
* **Visualization**: Grafana
* **Metrics Exporters**:

  * Node Exporter
  * kube-state-metrics

---

## 📂 Repository Structure

```
.
├── prometheus/
│   ├── prometheus-config.yaml
│   ├── prometheus-deployment.yaml
│   ├── prometheus-service.yaml
│   └── prometheus-alert-rules.yaml
│
├── alertmanager/
│   ├── alertmanager-config.yaml
│   ├── alertmanager-deployment.yaml
│   └── alertmanager-service.yaml
│
├── grafana/
│   ├── grafana-deployment.yaml
│   └── grafana-service.yaml
│
├── exporters/
│   ├── node-exporter.yaml
│   └── kube-state-metrics.yaml
│
├── screenshots/
└── README.md
```

---

## 🚀 Features

### ✅ Cluster Monitoring

* Node-level metrics (CPU, memory, disk, network)
* Pod-level metrics (restarts, status, resource usage)
* Kubernetes object visibility (deployments, namespaces)

### 🚨 Alerting

Configured production-grade alerts for:

* **Node Down**
* **High CPU Usage**
* **Pod CrashLoopBackOff**

Alerts are visible in:

* Prometheus UI
* Grafana Alerting
* Alertmanager UI

### 📊 Visualization

* Grafana dashboards for:

  * Node health
  * Pod performance
  * Kubernetes cluster overview
* Custom dashboard created using PromQL queries

---

## 🧪 Failure Scenarios Tested

| Scenario      | Result                                 |
| ------------- | -------------------------------------- |
| Pod deletion  | Kubernetes recreates pod automatically |
| CPU stress    | CPU alert triggered                    |
| Node shutdown | NodeDown alert fired                   |

These tests validate the **self-healing and alerting capabilities** of the monitoring stack.

---

## 🔐 Security & Best Practices

* Dedicated `monitoring` namespace
* RBAC enabled for Prometheus and kube-state-metrics
* Resource requests & limits configured
* No application code modified for monitoring

---

## 📸 Screenshots

Screenshots included in the `screenshots/` folder:

* EKS cluster nodes ready
* Prometheus targets UP
* Alertmanager UI
* Grafana dashboards
* Alert firing examples

---

## 💼 Resume Highlights

* Deployed a **production-grade monitoring and alerting stack** on AWS EKS
* Implemented Prometheus alert rules for node, pod, and resource failures
* Designed Grafana dashboards for real-time Kubernetes observability
* Validated monitoring by simulating real production failures

---

## 🎤 Interview Explanation (Quick)

> "I implemented a production-grade monitoring and alerting system on AWS EKS using Prometheus, Alertmanager, and Grafana. The system monitors node and pod metrics, triggers alerts on failures, and visualizes cluster health through dashboards. I validated it by simulating pod crashes, CPU spikes, and node failures."

---

## 📎 Future Improvements

* Integrate Slack / Email notifications
* Use ALB Ingress instead of NodePort
* Add long-term storage with Thanos
* Automate setup using Helm or Terraform

---

## 👨‍💻 Author

**Babu Lahade**
DevOps / Cloud Engineer (Fresher)
