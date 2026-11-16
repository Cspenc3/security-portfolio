# HMI availability investigation — November 7, 2026

**Incident type:** Isolated lab service-availability troubleshooting, **not a confirmed cyberattack**.  
**System:** GRFICSv3 SCADA-LTS (container HMI), Windows Docker Desktop.  
**Outcome:** Browser access recovered after a controlled HMI container restart. **Root cause undetermined.**

## Symptom
Browser attempted to load localhost:6081 but remained pending. An HTTP HEAD test and a normal GET request from Windows each timed out after about 10 seconds without receiving response bytes.

## Layer-by-layer evidence

| Test / command | Observation | Interpretation |
|---|---|---|
| docker ps / Docker Desktop | HMI container RUNNING | Container life-cycle != application health |
| docker exec HMI supervisorctl status | mariadb RUNNING; tomcat RUNNING; wazuh-agent RUNNING; init EXITED | Processes running; not proof of functioning access path |
| curl.exe -v --max-time 10 http://127.0.0.1:6081/ -o NUL | TCP connection established; GET sent; 0 HTTP response bytes before timeout | Windows can establish TCP but cannot complete HTTP |
| docker exec HMI curl ... http://127.0.0.1:8080/ | HTTP 302 to /login.htm | Tomcat responds from loopback inside container |
| docker exec HMI curl ... http://172.18.0.4:8080/ | HTTP 302 to /login.htm | Tomcat responds on admin interface |
| docker port HMI 8080 | 0.0.0.0:6081 and [::]:6081 | Published mapping configured |
| curl.exe ... http://127.0.0.1:6080/ | HTTP 200 WebSockify | Other published container service responds |
| docker exec EWS curl ... http://172.18.0.4:8080/ | HTTP 302 | Cross-container HMI HTTP path functions |
| docker exec EWS curl -H "Host: 127.0.0.1:6081" ... | HTTP 302 | Host header did not reproduce timeout |
| docker restart HMI | Browser subsequently reached SCADA-LTS login | Recovery achieved; reason for original failure not proven |

## Network context
- HMI attached to administrative Docker network (172.18.0.4) and lab DMZ (192.168.90.107).
- EWS attached to administrative Docker network (172.18.0.3) and ICS network (192.168.95.5).
- HMI default route via 172.18.0.1; route to 192.168.95.0/24 via 192.168.90.200.
- Multi-homing is an architectural observation, **not evidence of a vulnerability by itself**.

## Assessment
Host-to-container access was the problematic observed path; tests did not locate the precise component or mechanism causing delay. The controlled restart resolved the symptom. Further diagnosis would need time-correlated application logs, host forwarding diagnostics and a repeat occurrence.

## Recovery and lessons
- Restart only the affected HMI container after collecting diagnostic evidence; do not delete volumes or rebuild the lab.
- Re-test with actual HTTP GET and browser login, not just process status.
- Distinguish **recovery action** from **root-cause determination**.
- Preserve baseline and changes for comparison when validating availability under security controls.

## Evidence to add
Sanitized PowerShell output, Docker service log excerpt (if retained), before/after response test, HMI login screenshot. Screenshots were shown in the working conversation but **have not been attached to this GitHub folder**.
