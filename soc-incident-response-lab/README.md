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

### TLS Traffic Analysis

![TLS Handshake](evidence/screenshots/tls_successful_handshake.png)

A packet capture was performed using Wireshark to analyze network traffic. The capture shows a successful TLS 1.3 handshake between a local host and external servers.

The following sequence was observed:

- Client Hello – Initiates the secure connection
- Server Hello – Server responds with supported encryption parameters
- Certificate – Server presents its certificate for authentication
- Change Cipher Spec – Encryption parameters are applied
- Application Data – Encrypted data transmission begins

This sequence confirms that a secure communication channel was successfully established.

Additionally, QUIC protocol traffic was observed, which is commonly used in modern web applications (e.g., HTTP/3). This indicates normal network behavior and active encrypted communication.

### Analyst Observation

The traffic captured represents normal, healthy encrypted communication. While the contents of the data cannot be inspected due to encryption, analysis of the handshake process and traffic patterns confirms that no anomalies or failures occurred during this session.
