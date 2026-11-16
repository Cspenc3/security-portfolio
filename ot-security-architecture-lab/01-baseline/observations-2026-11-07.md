# Historical session observations — November 7, 2026

**Source:** Hands-on Windows PowerShell, Docker Desktop and browser observations from the user's isolated GRFICS environment. **Evidence status:** Output and screenshots were shared during live troubleshooting but are **not yet uploaded to this repository**. This is a historical session record, not a fresh November 15 verification.

## Observed
- Seven Docker containers displayed as running: caldera, EWS, router, kali, plc, HMI, simulation.
- Chemical plant dashboard at localhost loaded and showed "Simulation running"; attacker and defender workstation indicators showed reachable.
- HMI initially failed to return an HTTP response via localhost:6081 despite Docker reporting the container running.
- Tomcat and MariaDB processes displayed RUNNING in Supervisor.
- HMI responded with HTTP 302 internally and across the Docker admin network; EWS also received HTTP 302 from HMI.
- Windows reached EWS at localhost:6080 with HTTP 200.
- HMI restarted individually; the SCADA-LTS login page then loaded from Windows and an authenticated operator view was displayed.
- SCADA-LTS graphic view included a RUNNING indicator and a single set of process readings listed below.

## Single HMI reading (snapshot; not a time-series baseline)

| Measurement | Observed |
|---|---:|
| Reactor pressure | 2696.2 kPa |
| Reactor level | 44.1% |
| Feed 1 | 642.2 kmol/h |
| Feed 2 | 0.0 kmol/h |
| Product | 72.8 kmol/h |
| Purge | 0.0 kmol/h |
| Manual mode | OFF |
| HMI running indicator | RUNNING |

## What this does **not** prove
- That process readings update continuously.
- That the PLC is controlling the simulated process through a specific protocol.
- That all container services are healthy or network paths are secure.
- That the HMI timeout's root cause was Docker port forwarding. A restart restored access, but the underlying cause remains unknown.

## Next evidence
Recheck every port and network assignment after restart; save dated screenshots E01–E05, at least two readings, controller runtime status, and communication-path evidence.
