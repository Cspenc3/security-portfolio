# Incident Report: DNS Anomaly Investigation

## Summary
A network traffic analysis was conducted using Wireshark after abnormal DNS behavior was observed during packet capture review. The investigation identified repeated DNS queries to a non-existent domain, indicating potential misconfiguration, failed service communication, or abnormal system activity.

## Detection
The issue was identified during packet capture analysis in Wireshark. Repeated DNS requests were observed for the domain:

`fake-warehouse-sync-test-123.com`

The DNS responses returned "No such name," indicating failed domain resolution.

## Analysis
To understand the behavior, abnormal DNS traffic was compared against normal encrypted web traffic.

- TLS traffic showed a successful handshake and encrypted application data
- DNS traffic showed repeated failed lookups
- The repeated pattern suggested automated retry behavior rather than a single user-driven request

This behavior may indicate:

- Misconfigured application or service endpoint
- Automated script attempting to reach an invalid domain
- Potential beaconing-style behavior
- Reliability or connectivity issue causing repeated retries

## Response Actions
A Linux-based system review script was executed to gather host-level information after the abnormal traffic was identified.

The script performed the following actions:

- Listed active services
- Checked firewall status
- Reviewed `/home` directory permissions
- Collected recent authentication log entries
- Saved results to an output file for review

## Findings
- The DNS anomaly was confirmed as repeated failed name resolution
- The TLS traffic represented normal encrypted communication
- Host-level review provided additional context through service, firewall, permission, and authentication log checks
- No direct evidence of unauthorized access was identified during this basic review
- The behavior is most consistent with misconfiguration, failed service communication, or retry behavior rather than confirmed malicious activity

## Recommendations
- Validate application and DNS configurations
- Monitor for repeated failed DNS queries
- Correlate DNS failures with host logs and running services
- Add SIEM-style alerting for repeated DNS failures over a short time window
- Continue comparing abnormal network behavior against endpoint context before escalating

## Conclusion
This investigation demonstrates the importance of distinguishing between malicious activity and system misconfiguration. By combining network analysis with host-level inspection, a more accurate assessment of the event was achieved.

This case also supports SOC, OT, and SRE-style thinking by showing how repeated communication failures can appear suspicious while also potentially being caused by reliability or configuration issues.
