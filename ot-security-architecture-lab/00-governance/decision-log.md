# Engineering decision log

| ID | Date | Decision | Alternatives | Rationale / evidence | Verification / revisit |
|---|---|---|---|---|---|
| D-001 | 2026-11-15 | Use the existing GRFICSv3 Docker lab as the initial process | Build separate OpenPLC/FUXA stack first | Seven-container stack and HMI were observed on Nov. 7 | Check compatibility before adding new components |
| D-002 | 2026-11-15 | Record an operational baseline before control changes | Change firewall first | Enables pre/post comparison and protects availability | Phase 1 acceptance criteria |
| D-003 | 2026-11-15 | Keep one integrated scenario with numbered project phases | Independent disconnected exercises | Recruiter can trace a single design and evidence trail | Final engineering report |
| D-004 | 2026-11-15 | Keep public repository lab-only and credential-free | Upload raw screenshots/exports without review | Avoid exposure of secrets and employer information | Evidence review before commit |
| D-005 | 2026-11-15 | Treat the prior HMI restart as recovery, not proven root cause | Claim Docker forwarding defect | Restart restored access; specific cause was not established | See 01-baseline/hmi-availability-case.md |

Add decisions whenever you change topology, security policy, process controls, capture settings, or scope.
