# SOC Incident Response Lab

## Overview
This project simulates a SOC-style investigation of suspicious or abnormal network activity using Wireshark. The goal is to analyze traffic patterns, understand how secure communications appear in packet captures, and document how a security analyst could respond to unusual behavior.

The project also includes a basic Linux hardening script and PKI command examples to show post-investigation response actions and secure communication concepts.

## Objectives
- Capture and analyze network traffic in Wireshark
- Identify normal TLS behavior and compare it to failed or unstable communication
- Demonstrate basic system hardening through scripting
- Demonstrate PKI concepts using OpenSSL
- Connect SOC analysis to real-world OT and reliability scenarios

## Tools Used
- Wireshark
- Windows desktop
- Linux VM
- OpenSSL
- GitHub

## Current Progress
- Wireshark installed and tested
- Verified normal TLS handshake traffic
- Project repository structure created

## Planned Sections
- Traffic analysis
- Screenshots and evidence
- Hardening script
- PKI setup
- Incident report
- OT and SRE insight

## Traffic Analysis

### TLS Traffic Analysis (Normal Behavior)

![TLS Handshake](evidence/screenshots/tls_successful_handshake.png)

A packet capture was performed using Wireshark to analyze network traffic. The capture shows a successful TLS 1.3 handshake between a local host and external servers.

The following sequence was observed:

- Client Hello – Initiates the secure connection
- Server Hello – Server responds with supported encryption parameters
- Certificate – Server presents its certificate for authentication
- Change Cipher Spec – Encryption parameters are applied
- Application Data – Encrypted data transmission begins

This confirms that a secure communication channel was successfully established.

Additionally, QUIC protocol traffic was observed, which is commonly used in modern web applications (e.g., HTTP/3), indicating normal encrypted communication behavior.

### DNS Failure Analysis (Abnormal Behavior)

![DNS Failure](evidence/screenshots/dns_failed_lookup.png)

During analysis, repeated DNS queries were observed for a non-existent domain (`fake-warehouse-sync-test-123.com`). The responses consistently returned "No such name," indicating that the domain could not be resolved.

This behavior may indicate:

- Misconfigured application or service endpoint
- Automated system attempting to reach an invalid resource
- Potential beaconing behavior from a compromised system
- Network or configuration issues causing repeated retry attempts

### Analyst Comparison

The TLS traffic represents normal, expected encrypted communication, while the DNS failures demonstrate abnormal behavior that could require further investigation.

In a SOC environment, distinguishing between normal activity and suspicious patterns is critical. While repeated DNS failures may appear malicious, similar patterns can also result from system misconfiguration or operational issues.

This highlights the importance of analyzing both network behavior and system context before determining whether activity is truly malicious.

## Response Actions (Post-Investigation)

### Linux System Hardening Script

![Script Code](evidence/screenshots/linux_script_code.png)
![Script Execution](evidence/screenshots/linux_script_execution.png)
![Script Output](evidence/screenshots/linux_script_output.png)

Following the identification of abnormal network behavior, a basic Linux system review and hardening script was executed to simulate post-investigation response actions.

The script performs the following checks:

- Updates package lists to ensure system package information is current
- Lists active system services for review
- Checks firewall status using UFW
- Reviews directory permissions on `/home`
- Collects recent authentication log entries

### Analyst Insight

The script output provides visibility into host-level activity, including running services, firewall status, directory permissions, and recent authentication events. This type of information helps determine whether abnormal network behavior may be related to system configuration, legitimate services, or potential security concerns.

By combining network traffic analysis with host-level review, this project demonstrates a practical SOC workflow that includes detection, analysis, and response.

This also reinforces the importance of correlating network behavior with endpoint context before deciding whether activity is malicious, misconfigured, or caused by a reliability issue.
