# Cybersecurity Playbook (v1)

## Overview
This playbook outlines basic incident response procedures for common security events. It is designed to demonstrate foundational SOC workflows including detection, analysis, and response.

This playbook directly connects to the SOC Incident Response Lab project, where these procedures were applied in a practical scenario involving TLS traffic analysis, DNS anomalies, and Linux-based response actions.

---

## Tools Used
- Wireshark (network traffic analysis)
- Linux CLI (system review and log analysis)
- System logs (authentication and service activity)

---

## Incident Type 1: DNS Anomaly

### Description
Repeated DNS queries to non-existent domains or unusual domain names.

### Detection
- Observed in Wireshark during SOC Incident Response Lab
- Repeated queries returning "No such name"

### Analysis
- Domain pattern appeared invalid
- Behavior resembled automated retry attempts

### Response
- Investigated host system
- Executed Linux system review script
- Reviewed authentication logs and services

---

## Incident Type 2: Suspicious Network Traffic

### Description
Unusual or unexpected network communication.

### Detection
- Captured TLS traffic using Wireshark
- Identified normal handshake behavior for comparison

### Analysis
- Verified TLS handshake sequence (Client Hello → Server Hello → Application Data)
- Confirmed encrypted, legitimate communication

### Response
- Used baseline to compare against abnormal traffic
- Distinguished normal vs suspicious behavior

---

## Incident Type 3: Unauthorized Access Attempt (Basic)

### Description
Potential unauthorized login attempts or abnormal authentication activity.

### Detection
- Reviewed `/var/log/auth.log`

### Analysis
- Checked timestamps and sudo activity
- Verified expected user behavior

### Response
- Confirmed no unauthorized access
- Documented normal system activity

---

## Response Actions (Applied in Project)

The following actions were performed as part of the SOC Incident Response Lab:

- Executed a Linux system hardening and review script
- Collected system service data
- Checked firewall status
- Reviewed directory permissions
- Analyzed authentication logs

These steps demonstrate how host-level investigation complements network analysis.

---

## Analyst Notes

This playbook reflects a real-world workflow where network anomalies (DNS failures) were correlated with host-level analysis to determine whether activity was malicious or misconfigured.

The integration of Wireshark analysis and Linux system inspection demonstrates a complete SOC investigation approach.

---

## Future Improvements
- Expand incident types
- Add SIEM integration (Splunk-style)
- Include OT and SRE-related scenarios
