# E14 — Chemical process simulation Docker network membership

**Date of observation:** November 21, 2026  
**Source:** User-provided Windows PowerShell screenshot of a read-only Docker inspection of the `simulation` container.  
**Source screenshot status:** [Original E14 PNG uploaded and verified](E14-20261121-simulation-network-membership.png).

## Command and output

```powershell
docker inspect simulation --format '{{range $name, $net := .NetworkSettings.Networks}}{{println $name $net.IPAddress}}{{end}}'
```

```text
grfics_a-grfics-admin 172.18.0.7
grfics_b-ics-net 192.168.95.45
```

## Architecture comparison

| Component | Admin-network Docker IP | ICS-network Docker IP | Evidence |
|---|---|---|---|
| OpenPLC (`plc`) | `172.18.0.5` | `192.168.95.2` | [E13](E13-20261121-plc-network-membership.md) |
| Chemical plant (`simulation`) | `172.18.0.7` | `192.168.95.45` | This observation, E14 |

The six previously recorded OpenPLC Modbus TCP target configurations are `192.168.95.10–192.168.95.15`, TCP `502`, Unit ID `247`. They are within the same configured ICS subnet address range as both the PLC and simulation.

## Findings: verified vs. unresolved

**Verified:** Docker reports two networks and the listed two IPs for the simulation container at inspection time. Both `plc` and `simulation` attach to `grfics_b-ics-net`.

**Unresolved:** The Modbus endpoints are not among the simulation IPs reported by `docker inspect`. The output alone cannot establish whether those six addresses are additional IP aliases inside a container, addresses on a routed/emulated segment, separate interfaces, or otherwise hosted by the lab. The subsequent [E15 in-container inspection](E15-20261121-simulation-ip-alias-discovery.md) **confirmed all six aliases** on `simulation` `eth0`. This resolves the original address-location question, but does not prove TCP listener health or traffic. An absence of aliases in `docker inspect` did not mean they were absent inside the container.

**No claim yet:** Device reachability, successful Modbus requests, process-data exchange, segment policy or software vulnerability.

## Next read-only verification

**Completed in E15:** `docker exec simulation ip -o -4 addr show` revealed six secondary IP addresses corresponding to the configured Modbus targets. Next: inspect listening ports or passive traffic.

## Evidence to publish

[E14-20261121-simulation-network-membership.png](E14-20261121-simulation-network-membership.png) — uploaded and verified in this evidence folder.

**Checkpoint status:** Docker membership discovered; later E15 identifies Modbus endpoint IP alias hosting, while live traffic remains unverified.
