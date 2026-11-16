# SOC Analyst / Incident Response — Project 001

**Recruiter path:** This is the SOC and detection chapter of **one OT Security Architecture & Defense Lab**, not a second flagship project.

## Evidence available today — foundational SOC investigation

Before the chemical-plant incident exercise, I performed a separate training investigation of repeated DNS failures and reviewed host evidence. It provides a starting point for the evidence-handling methods I plan to apply to the OT environment.

- **[Read the completed DNS anomaly incident report](../../soc-incident-response-lab/report/incident_report.md)** — observed behavior, alternative hypotheses, findings and recommendations
- [SOC lab methods, screenshots and context](../../soc-incident-response-lab/README.md) — Wireshark TLS/DNS analysis, Linux host review and documentation
- [Analyst response playbook](../../Playbooks/cybersecurity-playbook.md) — triage and response process

**Scope note:** The DNS investigation was a **different lab scenario**, not an observed cyberattack on the GRFICS chemical plant. Its SIEM correlation is conceptual; no real SIEM integration was validated in that exercise. The Linux script gathers system details and updates package indexes rather than providing comprehensive system hardening.

## Project 001 — the integrated OT/SOC work (pending execution)

**Same simulated chemical plant, same asset inventory and baseline.** This chapter will use the traffic and architecture evidence collected in phases 1–3 to:

1. Define expected traffic by asset role, industrial protocol and zone.
2. Design testable detections for unexpected communication, access or process-related abnormalities.
3. Generate controlled lab-only anomalous activity without risking real equipment.
4. Correlate packet evidence, endpoint or controller context and available monitoring logs.
5. Compare a security hypothesis against operational failure, retry and misconfiguration explanations.
6. Document triage, uncertainty, process impact, response, recovery and residual risk.
7. Publish a reproducible incident report with evidence references and limitations.

**Status:** Planned. No claims yet of an executed GRFICS intrusion, validated SIEM rule, or completed OT detection exercise.

## Relevant objective alignment

- GIAC GRID: Monitoring, Detection, Threat Hunting and Analysis, Incident Response and Active Defense in ICS environments.
- GIAC GICSP: Protocols / Communications / Compromises and Risk-Based Disaster Recovery & Incident Response.
- Incident-handling concepts applicable to GCIH, without claiming full domain coverage.

[Return to the single project START HERE page](../README.md) · [Objective-to-evidence traceability](../00-governance/objectives-traceability.md)
