# Case 03 — Observability for Kubernetes capacity, not just uptime

**Situation.** A Kubernetes cluster stayed healthy while monthly spend drifted up. Requests were set once at launch, limits were copied across services and nobody could see which workloads reserved capacity they did not use.

**Approach.** We combined kube-state-metrics, node-exporter and application throughput metrics into Grafana views by namespace, workload and owner. Rightsizing recommendations were reviewed with the service team and tested under load; cost was never reduced by lowering replicas blindly.

**Tools.** Prometheus, kube-state-metrics, Grafana, Vertical Pod Autoscaler in recommendation mode, and OpenCost where cloud allocation is needed.

**Outcome to validate.** Track requested vs. used CPU/memory at p95, throttling, eviction events and cost allocation coverage. Savings are only counted after the new settings survive a representative traffic period.

**Practical rule.** Capacity dashboards must pair saturation with request rate and latency; resource utilization alone can suggest a dangerous reduction.
