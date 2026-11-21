# E14 — Chemical process simulation Docker network membership

**Date of observation:** November 21, 2026  
**Source:** User-provided Windows PowerShell screenshot of a read-only Docker inspection of the `simulation` container.  
**Source screenshot status:** Present in project conversation; PNG not yet uploaded to the GitHub evidence folder.

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

**Unresolved:** The Modbus endpoints are not among the simulation IPs reported by `docker inspect`. The output alone cannot establish whether those six addresses are additional IP aliases inside a container, addresses on a routed/emulated segment, separate interfaces, or otherwise hosted by the lab. An absence of alias addresses in `docker inspect` is *not* sufficient proof of their absence inside the container.

**No claim yet:** Device reachability, successful Modbus requests, process-data exchange, segment policy or software vulnerability.

## Next read-only verification

Run `docker exec simulation ip -o -4 addr show` from Windows PowerShell to list IPv4 assignments on the simulation container's interfaces, including potential additional interface addresses. If the command is unavailable in the image, record the error and use another read-only method later; do not install or change software yet.

## Evidence to publish

`E14-20261121-simulation-network-membership.png` — screenshot from the observation, upload into this same evidence folder.

**Checkpoint status:** Docker membership discovered; Modbus endpoint hosting and live traffic still under investigation.
