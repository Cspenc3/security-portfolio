# E15 — Simulation IP aliases explain all six Modbus targets

**Observation date:** November 21, 2026  
**Source:** Windows PowerShell screenshot of Docker inspection and `ip -o -4 addr show` executed read-only inside the GRFICSv3 `simulation` container.  
**Raw image status:** Shared in working conversation; original PNG has **not yet been uploaded to GitHub**.

## Read-only commands

```powershell
docker inspect simulation --format '{{range $name, $net := .NetworkSettings.Networks}}{{println $name $net.IPAddress}}{{end}}'
docker exec simulation ip -o -4 addr show
```

Relevant output (reformatted for legibility):

```text
grfics_a-grfics-admin 172.18.0.7
grfics_b-ics-net 192.168.95.45

eth1   172.18.0.7/16
eth0   192.168.95.45/24
eth0   192.168.95.10/24 secondary
eth0   192.168.95.11/24 secondary
eth0   192.168.95.12/24 secondary
eth0   192.168.95.13/24 secondary
eth0   192.168.95.14/24 secondary
eth0   192.168.95.15/24 secondary
```

(The screenshot also displayed loopback `127.0.0.1/8`; omitted from the summary above.)

## Configuration correlation

| OpenPLC configured device | Target IP | Simulation container interface | Address classification |
|---|---|---|---|
| Feed 1 | `192.168.95.10` | `eth0` | Secondary /24 |
| Feed 2 | `192.168.95.11` | `eth0` | Secondary /24 |
| Purge | `192.168.95.12` | `eth0` | Secondary /24 |
| Product | `192.168.95.13` | `eth0` | Secondary /24 |
| Tank | `192.168.95.14` | `eth0` | Secondary /24 |
| Analyzer | `192.168.95.15` | `eth0` | Secondary /24 |

The corresponding six OpenPLC configured destinations use port `502` with Unit ID `247` (see [six-device endpoint inventory](../modbus-endpoint-inventory.md)).

## Finding

**Verified:** All six configured target *IP addresses* are currently assigned as secondary IPv4 addresses to `eth0` inside the **same simulation container**, alongside its primary ICS address `192.168.95.45`. The PLC is separately attached to the same Docker ICS network at `192.168.95.2` ([E13](E13-20261121-plc-network-membership.md)).

**Architectural implication:** The six field-device names correspond to *logical Modbus endpoints simulated through one container*, not six separately evidenced Docker containers. Present this clearly in the conceptual architecture; do not portray the aliases as six independent hosts.

**Still unverified:** Listeners bound on TCP `502`, whether Modbus requests/replies are successfully exchanged with each alias, process variable semantics, potential errors, and monitoring visibility. Address presence alone proves neither a working Modbus service nor full controller-process integration.

## Next low-impact validation

From **Windows PowerShell**, inspect services listening *inside* the simulation container without initiating writes:

```powershell
docker exec simulation ss -lnt
```

Check whether TCP 502 listeners are present and which local addresses are bound. If `ss` is not installed, capture the message and choose another read-only inspection method. Later, validate actual Modbus transactions with controlled passive capture.

## Evidence image

Save and upload original screenshot as `E15-20261121-simulation-ip-aliases.png`, then update this report with the verified link.

**Checkpoint result:** Six device IP addresses physically located within the lab's simulation container; application-layer communication not yet verified.
