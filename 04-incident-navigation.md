# Case 04 — A navigable incident instead of four separate tools

**Situation.** During intermittent latency spikes, the response team could see graphs, log lines and distributed traces, but each investigation started from scratch and hand-offs lost context.

**Approach.** We standardised service labels, propagated trace context through asynchronous workers and added Grafana links from SLO panels to exemplars, Loki queries and deployment annotations. Each paging alert now points to one runbook with the initial triage questions.

**Tools.** Grafana, Tempo, Loki, Prometheus, OpenTelemetry and a GitOps deployment history.

**Outcome to validate.** Sample incident timelines: can a responder identify the affected service, change window and failed dependency without asking for access to another dashboard? Measure mean time to mitigation only over comparable incidents.

**Template.** Start with the supplied runbook; add service ownership, escalation path and the exact rollback command for your delivery system.
