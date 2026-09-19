# Case 01 — One telemetry contract for services and infrastructure

**Situation.** A growing B2B product had application logs in one system, node metrics in another and no reliable way to connect a slow request with a deployment or a database call.

**Approach.** We introduced OpenTelemetry SDK conventions at the application boundary, deployed an OpenTelemetry Collector gateway and normalized `service.name`, environment, version and Kubernetes resource attributes. Traces go to Tempo, metrics are exposed to Prometheus and structured logs retain trace IDs for correlation.

**Why this stack.** OpenTelemetry avoids binding the application to a single telemetry vendor. The Collector creates a controlled place for sampling, redaction and routing; Grafana provides the shared investigation surface.

**Outcome to validate.** The team should be able to go from an alert to a representative trace and matching logs in a few clicks. Track instrumentation coverage, dropped telemetry, ingest latency and the percentage of incidents with a trace ID. Do not claim a time-saving number until a baseline exists.

**Template.** `platform/otel-collector.yaml` is the starting gateway configuration. Add secrets and production endpoints through your deployment system, not in Git.
