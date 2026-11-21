# E16 — Simulation TCP listeners at six Modbus-configured endpoints

**Observation date:** November 21, 2026  
**Source:** Screenshot supplied during Phase 1 of the isolated GRFICSv3 lab.  
**Method:** Read-only listening-socket inspection with `ss` inside the `simulation` container.  
**Original PNG:** Shared in conversation; **not yet uploaded to GitHub**.

## Command used

```powershell
docker exec simulation ss -lnt
```

## Verified listener entries

| Configured device | Local listening socket | Observed state |
|---|---|---|
| Feed 1 | `192.168.95.10:502` | LISTEN |
| Feed 2 | `192.168.95.11:502` | LISTEN |
| Purge | `192.168.95.12:502` | LISTEN |
| Product | `192.168.95.13:502` | LISTEN |
| Tank | `192.168.95.14:502` | LISTEN |
| Analyzer | `192.168.95.15:502` | LISTEN |

The screenshot also showed listeners on `0.0.0.0:80`, `[::]:80`, `0.0.0.0:55555` and `127.0.0.11:34025`; these have not yet been attributed to particular application processes and are outside the focus of this test.

## Cumulative evidence chain

1. [E07–E12 configuration](../modbus-endpoint-inventory.md): Six configured targets at `192.168.95.10–15:502`, Unit ID `247`.
2. [E15 alias discovery](E15-20261121-simulation-ip-alias-discovery.md): All six IPs are secondary IPv4 addresses on `simulation` `eth0` in the ICS Docker network.
3. **E16 current observation:** The `simulation` container has listening TCP sockets at each of the six configured IP:port destinations.

**Verified:** The six target IPs are assigned and have active TCP listeners bound to port 502 at the time inspected.

**Not yet verified:** Whether OpenPLC is connecting to those sockets, whether the application actually implements expected Modbus transactions, whether all requests get responses, what register data means or whether the process is operationally healthy. A listening socket is not proof of a successful application protocol exchange.

## Next non-disruptive verification

Run `docker exec simulation ss -tn` during active normal operation to inspect current TCP sessions. If no connections appear in a single snapshot, record that observation without declaring communication absent; later capture traffic passively to verify actual Modbus exchanges.

## Screenshot to upload

`E16-20261121-modbus-tcp-listeners.png` — original `ss -lnt` screenshot, to be uploaded to this evidence directory.

**Result:** PASS for listeners matching all six configured endpoints; application-level communications pending.
