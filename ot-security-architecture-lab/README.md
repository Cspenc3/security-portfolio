# Project 001 — OT Security Architecture & Defense Lab

## The scenario

You are assigned to assess a **simulated industrial chemical plant** that relies on a controller, SCADA/HMI, engineering workstation, field-device simulation, and interconnected networks to operate a reactor.

Your engineering task is to **establish normal operation, understand how components communicate, identify security and availability risks, design and validate defensive controls, and investigate suspicious behavior without unnecessarily disrupting the process**. Every conclusion must follow from reproducible tests and evidence.

### The environment at a glance

![GRFICSv3 Phase 1 high-level topology](01-baseline/diagrams/grficsv3-phase-01-high-level-topology.png)

*Figure 1 — Initial GRFICSv3 lab topology. Conceptual illustration based on a partially verified asset inventory; not all pictured paths and network memberships have been confirmed. We will refine this same design when we reach network engineering and Cisco Packet Tracer.*

**Status:** Phase 1 asset discovery and transport-level verification documented; packet-level industrial protocol analysis and protection tests remain ahead. This is an isolated personal lab, not a production security assessment.

### Phase 1 — The first engineering finding

**The controller was configured to communicate with six Modbus TCP devices. Where were those devices actually hosted?**

The investigation found that **all six target addresses belong to one simulation container as secondary IPs**. All six had TCP port 502 listeners, and a later observation showed established TCP sessions from OpenPLC. We also observed changing HMI values and differentiated early connection errors from later activity—without treating them as evidence of an attack.

**[Read the Phase 1 assessment — one page, illustrated and evidence-based](01-baseline/README.md)**

*The report tells the investigation from start to finish. The original screenshots, register details, test logs and runbook remain available inside its optional technical appendix.*

## Find the skills relevant to your role

| What you're evaluating | Go directly to | Evidence status |
|---|---|---|
| **OT / ICS security engineering** | [Phase 1 operational baseline case study](01-baseline/README.md) · [Architecture & trust boundaries](02-architecture/README.md) | Baseline documented; boundary analysis ahead |
| **SOC analyst / incident response** | **[SOC investigation & detection](05-detection-response/README.md)** | A prior DNS investigation is documented; *chemical-plant detection* is planned |
| **Network / security engineering** | [Verified configuration inventory: six Modbus endpoints](01-baseline/modbus-endpoint-inventory.md) · [Network inventory](01-baseline/network-inventory.csv) · [Industrial traffic analysis](03-protocol-analysis/README.md) | Network memberships observed; protocol capture pending |
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

## Assessment progress

**Phase 1 — Evidence-backed operational and network baseline:** The assessment identified seven running containers, documented SCADA-LTS process observations, and established the six Modbus TCP endpoints' configuration, IP ownership, listening services and observed TCP connections. **Modbus packet contents, process-variable meaning and security controls remain unverified.**

**[Read Phase 1: The full investigation and conclusions](01-baseline/README.md)** — start with the report; open the underlying evidence only when deeper verification is useful.

**Next:** Phase 2 investigates architecture and trust boundaries; Phase 3 will establish an application-layer traffic baseline using packet evidence.

## Evidence and integrity

Reports distinguish **observed facts**, **hypotheses**, **validated results**, and **planned tests**. Supporting SOC coursework is clearly marked as an *earlier separate training scenario*; it is not misrepresented as a chemical-plant security incident. Only isolated, sanitized lab evidence will be published. No employer systems, credentials or production data are used.

**Document owner:** Christopher Spencer · CySA+ · Industrial maintenance / cybersecurity · B.S. Cybersecurity in progress
