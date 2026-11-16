# Project 001 — OT Security Architecture and Defense Lab

**Status: Phase 1 in progress (baseline verification).**  
**Environment:** Isolated GRFICSv3 simulated chemical plant on Docker Desktop/WSL2.  
**Owner:** Christopher Spencer. **Purpose:** Public, evidence-led engineering portfolio.

## One scenario, one evidence trail

Act as the defender assessing a virtual chemical plant. Establish normal operation; map assets, process dependencies and network zones; inspect actual communications; design and validate defensive controls; investigate a controlled security event; evaluate residual operational risk. This is a **simulation**, not a production assessment or claim of employment-based security operations.

## Project roadmap and evidence

| Phase | Question | Deliverable | Status |
|---|---|---|---|
| 1 — Baseline | What exists, works, and communicates? | Asset inventory, service checks, process readings, HMI recovery case | In progress |
| 2 — Architecture | Where are trust boundaries and permitted paths? | Diagram, zone/conduit and data-flow matrix | Planned |
| 3 — Protocol analysis | What is normal network behavior? | Sanitized PCAP, Wireshark findings and repeatable tests | Planned |
| 4 — Security controls | What controls reduce risk without harming availability? | Change plan, rules/config, pre/post validation | Planned |
| 5 — Detection and response | Can suspicious changes be detected, triaged and handled? | Lab-generated evidence, detection logic, incident report | Planned |
| 6 — Risk and validation | What residual risk remains? | Risk treatment, test comparison and recovery analysis | Planned |
| 7 — Final report | What did the engineering work prove? | Technical report and executive summary | Planned |

## Start here

- [Project charter](00-governance/project-charter.md)
- [Certification objective traceability](00-governance/objectives-traceability.md)
- [Risk register](00-governance/risk-register.csv) and [decision log](00-governance/decision-log.md)
- [Phase 1 guide — exactly when to record evidence](01-baseline/README.md)
- [Asset inventory](01-baseline/asset-inventory.csv)
- [Observed Nov. 7 baseline](01-baseline/observations-2026-11-07.md)
- [HMI troubleshooting case](01-baseline/hmi-availability-case.md)
- [Verification results](01-baseline/test-results.csv)

## Evidence standards

Every claim must link to **a test, observation, timestamp, and supporting artifact**. Distinguish *observed*, *inferred*, and *not yet tested*. The process visualization and SCADA login worked on November 7, 2026, but dynamic PLC-process communication, packet analysis, and security-control performance are **not yet validated**. Screenshots mentioned in historical notes have not yet been uploaded to this repository.

Only isolated lab data may be published. Remove passwords, tokens, personal information, and any Walmart production or proprietary information. Never imply that a default lab credential is suitable for production. No connection to a live industrial controller or employer network is part of this project.

## Reference frameworks

The exercises are tagged to selected official [GIAC GICSP](https://www.giac.org/certifications/global-industrial-cyber-security-professional-gicsp) and [GIAC GRID](https://www.giac.org/certifications/response-industrial-defense-grid) objectives, alongside the [PMI-RMP exam outline](https://www.pmi.org/certifications/risk-management-rmp). They are *inspired by* the objectives; they do not represent GIAC endorsement, complete exam coverage, or certification.

## Current next action

Restart the GRFICS Docker project, open the simulation and HMI, and complete the Phase 1 verification checklist with fresh dated evidence. Do not modify process controls or security configuration during baseline collection.
