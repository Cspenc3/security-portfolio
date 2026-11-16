# Cybersecurity & OT Security Engineering Portfolio

**Christopher Spencer | CompTIA CySA+ | Industrial maintenance & cybersecurity | Developing OT/ICS security engineering skills**

This repository presents my cybersecurity investigations, security documentation, and learning projects. My background in industrial equipment troubleshooting informs how I evaluate network reliability, availability, and security tradeoffs.

My long-term focus is **secure industrial network and control-system architecture**. The projects below distinguish **documented work** from **planned exercises** so reviewers can see the evidence behind each claim.

## Start Here — Documented Work

| Project | Skills demonstrated | Evidence |
| --- | --- | --- |
| **[SOC Incident Response Lab](./soc-incident-response-lab/README.md)** | Wireshark analysis, DNS investigation, TLS traffic review, Linux host checks, and incident reasoning | [Investigation report](./soc-incident-response-lab/report/incident_report.md), [screenshots](./soc-incident-response-lab/evidence/screenshots/), and [Linux review script](./soc-incident-response-lab/scripts/system_hardening.sh) |
| **[Cybersecurity Response Playbook](./Playbooks/cybersecurity-playbook.md)** | Structured triage, evidence review, and response documentation | Written playbook connected to the SOC lab |
| **[Networking Fundamentals (CYB 210)](https://github.com/Cspenc3/network-triage-pcap)** | Subnetting and protocol study notes | Separate reference repository; packet-analysis exercises are not yet completed |
| **[Network Security Sandbox (CYB 220)](https://github.com/Cspenc3/CYB220-project-one-sandbox)** | IP configuration, segmented network concepts, Windows policy configuration, and connectivity checks | Separate repository with lab write-up and screenshots |
| **[Incident Response Workflows](https://github.com/Cspenc3/incident-response-workflows)** | Playbooks, incident handling concepts, and reusable response documentation | Separate repository |

### Featured investigation: DNS failures versus malicious activity

The [SOC Incident Response Lab](./soc-incident-response-lab/README.md) explores repeated unsuccessful DNS lookups using packet evidence and a basic Linux system review. The [incident report](./soc-incident-response-lab/report/incident_report.md) compares explanations such as configuration errors, retry behavior, and possible malicious activity without treating an anomaly alone as proof of compromise.

This reflects an approach I want to carry into OT environments: **understand expected system behavior, examine evidence, and consider operational impact before drawing conclusions**.

> **Evidence boundaries:** This project uses Wireshark screenshots and documented analysis. The SIEM correlation described in the lab is conceptual; a deployed SIEM integration is not demonstrated by this project. The Linux script primarily collects host information and refreshes package indexes, rather than implementing a comprehensive hardening baseline.

## Projects in Planning / Early Draft

These directories are **project outlines, not completed hands-on implementations**:

- [SOC Automation Lab](./SOC-Automation-Lab/README.md) — planned enrichment, automation, and response workflows
- [Cloud Security Project](./Cloud-Security-Project/README.md) — planned cloud-security exercises
- [IR Case Studies](./IR-Case-Studies/) — initial Windows and Linux investigation outlines

## Flagship Project — OT Security Architecture and Defense Lab

**Status: Phase 1 in progress.** The virtual GRFICSv3 chemical-plant simulation, SCADA-LTS login/graphic, and selected HTTP paths were observed during a November 7, 2026 session. Live controller-to-process data exchange and packet capture are still to be verified.

**[Explore Project 001: OT Security Architecture and Defense Lab](./ot-security-architecture-lab/README.md)** — one integrated industrial cybersecurity scenario with a project charter, certification objective mapping (GICSP / GRID / PMI-RMP), risk register, Phase 1 asset inventory and a documented HMI availability investigation.

Future phases cover zone/conduit design, industrial packet analysis with Wireshark, control validation, detection/response and residual-risk reporting. Each claim will be supported by a reproducible test and lab-only evidence.

## Working Principles

- Document the intended system behavior and security requirements.
- Explain the reason for each configuration decision.
- Validate changes with reproducible tests and observable evidence.
- Consider reliability and availability alongside security.
- Keep portfolio labs isolated and free of employer data, credentials, or production configurations.

## Education & Credentials

- **CompTIA CySA+**
- **B.S. Cybersecurity**, Project Management concentration, Southern New Hampshire University (in progress)
- Continuing hands-on study in network engineering, SOC investigation, OT/ICS systems, and risk management

## Connect

- [GitHub profile](https://github.com/Cspenc3)
- [LinkedIn](https://www.linkedin.com/in/christopher-spencer-3a1a8827b/)
