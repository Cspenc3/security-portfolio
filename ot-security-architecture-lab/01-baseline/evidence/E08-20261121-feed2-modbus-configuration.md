# E08 — Feed 2 Modbus TCP configuration

**Observation date:** November 21, 2026
**Source:** Screenshot from the OpenPLC **Edit slave device** screen for **Feed 2**, supplied during the isolated GRFICSv3 lab.
**Method:** Read-only inspection; no changes or saves reported.
**Image status:** [Feed 2 screenshot uploaded and verified](E08-20261121-feed2-modbus-config.png).

## Configured endpoint

| Parameter | Value |
|---|---|
| Device Name | Feed 2 |
| Device Type | Generic Modbus TCP Device |
| Slave / Unit ID | `247` |
| IP Address | `192.168.95.11` |
| TCP port | `502` |
| Discrete inputs | Start 0; size 0 |
| Coils | Start 0; size 0 |
| Input registers | Start 1; size 2 |
| Holding registers — read | Start 0; size 0 |
| Holding registers — write | Start 1; size 1 |

The device edit form shows labels `%IW100` and `%QW100` for input/write sections. The separate **Slave Devices inventory screen** allocates Feed 2's OpenPLC memory to `%IW102–%IW103` and `%QW101`. We are retaining both source observations; we should verify how OpenPLC's per-device form headings relate to the aggregate memory allocations rather than claiming an established misconfiguration or treating these as packet-level Modbus offsets.

## Comparison with Feed 1

| Field | Feed 1 | Feed 2 |
|---|---|---|
| Endpoint | `192.168.95.10:502` | `192.168.95.11:502` |
| Slave/Unit ID | 247 | 247 |
| Input register start/size | 1 / 2 | 1 / 2 |
| Write holding register start/size | 1 / 1 | 1 / 1 |

Two separate IP endpoints are configured. Sharing Modbus Unit ID 247 at different IP endpoints is not, by itself, an address conflict.

## What remains unverified

- Whether the host at `192.168.95.11:502` is reachable and accepting TCP connections.
- Whether real Modbus requests/replies are successful and what function codes/offsets they contain.
- Whether Feed 2 values actually propagate to the chemical process simulation.
- Whether the edit form's memory labels are common headings, per-device mapping, or another form behavior.

## Next action

Capture the remaining device configuration screens (Purge, Product, Tank, Analyzer) read-only to complete the endpoint inventory; then use controlled read-only communication tests to verify expected paths.

**Screenshot:** [E08-20261121-feed2-modbus-config.png](E08-20261121-feed2-modbus-config.png), published beside this report. Do not disclose credentials.
