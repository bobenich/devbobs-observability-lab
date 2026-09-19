# Checkout: error-budget burn

## Signal

The 5-minute HTTP 5xx ratio is above 2% for 10 minutes.

## Triage

1. Confirm customer impact in the checkout success-rate dashboard.
2. Open an exemplar trace for a failed request; identify the first failing dependency.
3. Compare current deploy, dependency latency and pod restarts with the start of the burn.
4. Roll back only a verified implicated release; otherwise mitigate the failing dependency.

## Escalation data

Include timeframe, request/error counts, trace ID, deployment revision and the mitigation attempted. Do not paste request bodies, bearer tokens or customer data.
