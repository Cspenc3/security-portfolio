# SOC Incident Response Lab

## Overview
This project simulates a SOC-style investigation of suspicious or abnormal network activity using Wireshark. The goal is to analyze traffic patterns, understand how secure communications appear in packet captures, and document how a security analyst could respond to unusual behavior.

Related Playbook: [Cybersecurity Playbook (v1)](../Playbooks/cybersecurity-playbook.md)

---

## Objectives
- Capture and analyze network traffic in Wireshark
- Identify normal TLS behavior and compare it to failed or unstable communication
- Demonstrate basic system hardening through scripting
- Connect network and host-level analysis

---

## Tools Used
- Wireshark
- Linux VM (Ubuntu)
- VirtualBox
- Bash scripting
- GitHub

---

## Traffic Analysis

### TLS Traffic Analysis (Normal Behavior)

![TLS Handshake](evidence/screenshots/tls_successful_handshake.png)

A packet capture was performed showing a successful TLS 1.3 handshake, confirming normal encrypted communication.

### DNS Failure Analysis (Abnormal Behavior)

![DNS Failure](evidence/screenshots/dns_failed_lookup.png)

Repeated DNS queries to a non-existent domain resulted in "No such name" responses, indicating abnormal or misconfigured behavior.

### Analyst Comparison

TLS traffic represents expected behavior, while DNS failures demonstrate abnormal patterns requiring investigation.

---

## Response Actions (Post-Investigation)

### Linux System Hardening Script

![Script Code](evidence/screenshots/linux_script_code.png)
![Script Execution](evidence/screenshots/linux_script_execution.png)
![Script Output](evidence/screenshots/linux_script_output.png)

A Linux system review script was executed to simulate post-incident response.

The script:
- Updates packages
- Lists running services
- Checks firewall status
- Reviews permissions
- Collects authentication logs

### Analyst Insight

Combining network analysis with host-level inspection helps determine whether abnormal behavior is malicious, misconfigured, or related to system reliability.

---

## Summary

This project demonstrates a full SOC workflow:

- Detection (Wireshark)
- Analysis (TLS vs DNS)
- Response (Linux system review)

It highlights the importance of correlating network and system data during investigations.
