# E01 — GRFICS startup and container health (transcribed)

**Observation date/time:** 2026-11-18T13:49:39.1258906-06:00 (America/Chicago, according to Windows PowerShell).  
**Operator:** Christopher Spencer.  
**Source:** User-provided screenshot of a Windows PowerShell 5.1 session. **This Markdown file is a transcription; the original screenshot is not uploaded to GitHub.**

## Read-only verification

PowerShell commands were supplied and run in this session:

~~~powershell
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
Get-Date -Format o
~~~

### Observed results

| Container | Reported state | Published host:container port(s) |
|---|---|---|
| caldera | Up About a minute (healthy) | 8888:8888 |
| EWS | Up About a minute (healthy) | 6080:6080 |
| router | Up About a minute (healthy) | None shown |
| kali | Up About a minute (healthy) | 6088:6080 |
| plc | Up About a minute (healthy) | 8080:8080 |
| HMI | Up About a minute (healthy) | 6081:8080 |
| simulation | Up About a minute (healthy) | 80:80 |

Published host address shown for mapped ports: \`0.0.0.0\` (IPv4) and \`[::]\` (IPv6).

## Assessment

**Verified:** All seven expected containers were shown as running and reporting healthy; listed host ports matched the previous inventory.  
**Not yet verified:** HMI/application HTTP availability during this session, chemical plant visualization, PLC controller state, dynamic process-value updates, industrial data flow, and completeness of security controls.

**Result:** Phase 1 Checkpoint 1 — PASS (container/port inventory only).

## Evidence gap and next checkpoint

The visual screenshot is preserved in the working conversation. To make this evidence independently reviewable on GitHub, upload a sanitized copy named \`E01-20261118-docker-containers.png\` and reference it here. Next step is Phase 1 Checkpoint 2: open the process simulation dashboard and capture \`E02-20261118-simulation-dashboard.png\` without interacting with control/fault-injection functions.
