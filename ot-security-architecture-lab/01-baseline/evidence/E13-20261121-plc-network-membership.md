# E13 — OpenPLC container network membership

**Observation date:** November 21, 2026  
**Source:** Screenshot supplied by project owner of Windows PowerShell output from Docker inspection of the isolated GRFICSv3 lab. The same command was executed twice with matching results.  
**Evidence image:** Original PNG shown in conversation, **not yet uploaded to GitHub**.

## Read-only command and observed output

```powershell
docker inspect plc --format '{{range $name, $net := .NetworkSettings.Networks}}{{println $name $net.IPAddress}}{{end}}'
```

```text
grfics_a-grfics-admin 172.18.0.5
grfics_b-ics-net 192.168.95.2
```

## Engineering interpretation

- **Verified:** Docker reports the `plc` container attached to both the administrative network and the ICS network. These are the container's addresses at the time of observation.
- **Relevant configuration relationship:** The six previously documented Modbus TCP endpoints (`192.168.95.10` to `192.168.95.15`, TCP 502) are within the same `192.168.95.0/24` address range as the PLC's `192.168.95.2` interface.
- **Not verified:** Container network attachment of those six endpoints; TCP reachability, Modbus exchanges, authorized network paths, and which process simulator interfaces implement them.
- **Topology impact:** The high-level diagram should show the PLC attached to both the admin and ICS networks, without inventing traffic links.

## Next controlled inspection

Check the `simulation` container's reported Docker network memberships and addresses using the same read-only Docker inspect method. This may help locate the device endpoints and test the distinction between independently containerized field devices and simulated interfaces hosted together.

## Screenshot still to publish

`E13-20261121-plc-network-membership.png` — attach the PowerShell screenshot, excluding any sensitive host details.
