# Project 001 — OT Security Architecture & Defense Lab

**START HERE.** One simulated chemical plant. One engineering investigation. Multiple cybersecurity skill areas, each backed by evidence.

**Status:** Phase 1 — baseline verification in progress. This is an isolated personal lab, not a production security assessment.

## Find the skills relevant to your role

| What you're evaluating | Go directly to | Evidence status |
|---|---|---|
| **OT / ICS security engineering** | [Plant baseline and HMI investigation](01-baseline/README.md) · [Architecture & trust boundaries](02-architecture/README.md) | Baseline partly observed; architecture work ahead |
| **SOC analyst / incident response** | **[SOC investigation & detection](05-detection-response/README.md)** | A prior DNS investigation is documented; *chemical-plant detection* is planned |
| **Network / security engineering** | [Network inventory](01-baseline/network-inventory.csv) · [Industrial traffic analysis](03-protocol-analysis/README.md) | Network memberships observed; protocol capture pending |
| **Risk / project management** | [Charter](00-governance/project-charter.md) · [Risk register](00-governance/risk-register.csv) · [Decision log](00-governance/decision-log.md) | Living project documents published |
| **Certification-aligned practical tests** | [GICSP, GRID & PMI-RMP objective-to-evidence map](00-governance/objectives-traceability.md) | Select objectives mapped; completion tracked honestly |

## The single project story

**Assess → Understand → Protect → Detect → Respond → Validate.**

1. **Baseline:** What assets exist? Is the HMI and process accessible? What is verified versus assumed?
2. **Architecture:** What are the actual network zones, systems, routes, and intended communication paths?
3. **Protocol evidence:** What packets are exchanged? Which industrial protocols and values are actually observed?
4. **Defense:** What security control can be implemented without impairing process availability?
5. **Detection & response:** What would distinguish a process/network failure from suspicious behavior?
6. **Risk:** What changed, what remains uncertain, and what is the residual operational impact?
7. **Report:** Can another engineer reproduce the result from the evidence?

Each phase is **a chapter in the same plant assessment**, not an unrelated portfolio project.

## Verified work so far

On **November 7, 2026**, seven GRFICSv3 containers displayed as running; the chemical-plant visualization loaded; SCADA-LTS was accessed; and an HMI service-availability problem was systematically investigated and recovered by restarting the affected container.

- [Read the documented HMI investigation](01-baseline/hmi-availability-case.md)
- [Read the historical observations and displayed reactor readings](01-baseline/observations-2026-11-07.md)
- [View current asset inventory](01-baseline/asset-inventory.csv)
- [Follow Phase 1 tests and evidence capture instructions](01-baseline/README.md)

**Not yet proven:** Live PLC-to-process communications, industrial PCAP analysis, deployed security controls or chemical-plant detection rules. Historical screenshots were reviewed during the working session but have not yet been uploaded here.

## Evidence and integrity

Reports distinguish **observed facts**, **hypotheses**, **validated results**, and **planned tests**. Supporting SOC coursework is clearly marked as an *earlier separate training scenario*; it is not misrepresented as a chemical-plant security incident. Only isolated, sanitized lab evidence will be published. No employer systems, credentials or production data are used.

**Document owner:** Christopher Spencer · CySA+ · Industrial maintenance / cybersecurity · B.S. Cybersecurity in progress
