# Case 02 — From alert noise to an actionable error budget

**Situation.** Engineers received CPU, pod and endpoint alerts independently; many alerts had no user impact and the important ones were lost in the channel.

**Approach.** We defined a customer-facing success event for checkout, started with a measured availability objective, and created multi-window burn alerts. Infrastructure alerts remained for diagnosis but stopped paging by default unless they predicted user impact.

**Tools.** Prometheus recording rules, Alertmanager routing, Grafana SLO dashboards and a versioned Markdown runbook.

**Outcome to validate.** Compare pages per week, acknowledgement time and incidents that exhausted budget before and after the change. Review the objective each quarter; an SLO is a product decision as much as an operations decision.

**Template.** `platform/prometheus-rules.yaml` and `docs/runbooks/checkout-error-budget.md` show the minimum linkage between signal, alert and response.
