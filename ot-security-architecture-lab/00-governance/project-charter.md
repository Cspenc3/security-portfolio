# Project charter — Project 001

**Title:** OT Security Architecture and Defense Lab  
**Owner / sponsor:** Christopher Spencer (personal learning project)  
**Environment:** GRFICSv3 simulated chemical plant, Docker Desktop/WSL2  
**Project state:** Active; Phase 1 in progress  
**Document version:** 0.1 — November 15, 2026

## Problem statement
A functioning virtual industrial environment is not automatically a verified or secure environment. Before recommending defenses, the engineer must identify assets and network boundaries, establish normal process and application behavior, distinguish observed faults from suspected cyber events, and preserve operational availability.

## Objective
Produce a reproducible, evidence-based assessment and defensive validation for **one** simulated chemical plant, showing design rationale, security observations, measurable test outcomes, incident handling, and residual risk.

## Scope
- Inventory GRFICS containers, services, network interfaces and logical roles.
- Verify simulation, HMI, PLC management interface and actual data-path behavior.
- Capture/inspect traffic on a controlled, authorized lab network.
- Design and validate segmentation/access/monitoring controls in the isolated lab.
- Run approved lab-only scenarios, document findings and recovery decisions.
- Maintain charter, change decisions, risk register and final report.

## Out of scope
- Scanning, modifying, or capturing any Walmart or third-party production network.
- Treating demonstration challenges as verified real-world vulnerabilities.
- Deploying this environment as a production-secure ICS.
- Claiming exam objective mastery without test evidence.

## Success measures
1. One documented asset list and network/data-flow diagram with identified unknowns.
2. Dated baseline and reproducible PLC-HMI/process verification tests.
3. A sanitized packet capture with reproducible analysis and packet references.
4. At least one documented control tested before and after implementation.
5. At least one controlled incident scenario with an evidence-backed response.
6. Risk decisions, limitations, and findings traceable to test artifacts.

## Constraints and assumptions
- Only the user's isolated virtual lab is in scope.
- Current ports/IPs can change after a Docker restart; reconfirm every session.
- Stable HMI values do not alone prove communications are working or broken.
- Changes that could disrupt process operation require pre-test baseline and recovery plan.

## Approach
Baseline -> architecture -> protocol analysis -> protection -> detection/response -> risk validation -> final report. Update the risk and decision logs throughout, not just at the end.
