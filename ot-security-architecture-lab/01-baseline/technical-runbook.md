# Technical runbook — Phase 1 collection checklist (archived)

This is the original collection-oriented Phase 1 README, preserved on November 21, 2026 when the primary README was redesigned as a **recruiter-facing assessment report**. Some TODOs below reflect the early plan and are no longer current; consult the [Phase 1 case study](README.md) and [evidence index](evidence/README.md) for the actual results.

---

# Phase 1 — Asset discovery and operational baseline

**Goal:** Prove what is running, what is reachable, and what process data is observable *before* changing anything.

## What to document and when

| When | Action | Save evidence | Pass criteria |
|---|---|---|---|
| Before starting Docker | Record timestamp and environment (OS, Docker version, lab start state) | session-template.md | Session timestamp and versions recorded |
| Immediately after starting GRFICS | Expand Docker project; record every container, status and host:container ports | Screenshot E01; asset-inventory.csv | Seven expected containers accounted for; note anomalies |
| Before clicking HMI controls | Open http://localhost/ and capture chemical plant status | Screenshot E02 | Simulation interface loads; record reported health only |
| At HMI login and dashboard | Open http://localhost:6081; authenticate locally without publishing credential; record process display values | Screenshot E03 and observation table | HMI accessible; values visible |
| 60 seconds later | Observe pressure, level, flow and RUNNING indicator again | Screenshot E04 and observation table | Two dated readings captured; no assumption that stable=broken |
| After HMI verification | Open http://localhost:8080; record PLC management status without changing configuration | Screenshot E05 | Web access recorded; controller runtime/data path still separately tested |
| At session end | Record abnormal behavior, test results, files saved, and unanswered questions | test-results.csv and session-template.md | Findings distinguish verified vs suspected |

Use screenshots only from this isolated lab. Never show passwords, tokens, or personal/employer data. Rename screenshots E01...E05 before publishing; do not call them uploaded until actually added.

## Safe start and read-only checks (Windows PowerShell)

~~~powershell
Get-Date -Format o
docker version
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
curl.exe -sS -D - --max-time 15 http://127.0.0.1:6081/ -o NUL
curl.exe -sS -D - --max-time 15 http://127.0.0.1:8080/ -o NUL
~~~

Record HTTP status codes; redirects (301/302) mean the web server responded, not necessarily that the whole app is functional. If an endpoint times out, stop and record before restarting services.

## Process observation sheet — fill during current session

| Timestamp (with time zone) | Pressure kPa | Reactor level % | Feed 1 kmol/h | Feed 2 kmol/h | Product kmol/h | Purge kmol/h | Mode | Running indicator |
|---|---|---|---|---|---|---|---|---|
| T0 — TODO | TODO | TODO | TODO | TODO | TODO | TODO | TODO | TODO |
| T1 — ~60s later | TODO | TODO | TODO | TODO | TODO | TODO | TODO | TODO |

**Interpretation:** Note which values changed and by how much; if nothing changes, record "no change observed during interval." A further source-of-truth check is needed before asserting the PLC and simulation exchange data.

## Completed configuration inventory

The [six-device Modbus TCP endpoint inventory](modbus-endpoint-inventory.md) documents Feed 1, Feed 2, Purge, Product, Tank and Analyzer network destinations, Unit IDs and assigned input/output word ranges from OpenPLC. The subsequent [simulation interface discovery](evidence/E15-20261121-simulation-ip-alias-discovery.md) identified all six configured IPs as secondary addresses on **one simulation container**, not six separate confirmed hosts. **Actual Modbus packet exchange remains to be tested**.

## Further Phase 1 verification (not yet complete)
1. Record the PLC management screen and runtime status.
2. Inspect HMI configured data source and intended controller address **read-only**.
3. Verify controller/process data exchange with a safe, observable check; record protocol/endpoint and method.
4. Map all seven containers' network memberships (not just EWS/HMI).
5. Confirm repeatability across one restart without changing controls.

## Exit criteria
- Asset and interface inventory complete, with unknowns clearly labeled.
- Reproducible observations at T0 and T1 with dated screenshots.
- HMI, simulation and PLC management access checks recorded.
- Actual data-source/controller-to-process communication checked, or explicitly flagged not verified.
- Initial hazards and uncertainties entered in the risk register.
- Findings and evidence URLs linked from README.
