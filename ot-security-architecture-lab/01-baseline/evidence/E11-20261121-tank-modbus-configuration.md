# E11 — Tank Modbus TCP endpoint configuration

**Observation date:** November 21, 2026  
**Source:** Screenshot supplied during the isolated GRFICSv3 lab from OpenPLC **Edit slave device** for Tank.  
**Method:** Read-only review; no configuration changes reported.  
**Screenshot status:** Original PNG has not yet been uploaded to GitHub.

## Observed configuration

| Field | Value |
|---|---|
| Device name | Tank |
| Device type | Generic Modbus TCP Device |
| Slave / Unit ID | `247` |
| IP address | `192.168.95.14` |
| TCP port | `502` |
| Discrete inputs | Start 0; size 0 |
| Coils | Start 0; size 0 |
| Input registers | Start 1; size 2 |
| Holding registers — read | Start 0; size 0 |
| Holding registers — write | Start 1; size 1 |

The per-device screen labels the Input Registers and Holding Registers — Write sections `%IW100` and `%QW100`. In contrast, the earlier Slave Devices summary allocated Tank to `%IW108–%IW109` and `%QW104`. These represent distinct OpenPLC screen contexts; the relationship between the labels, overall I/O allocation and on-wire Modbus register offsets remains to be verified. We do not infer a mapping to packet-level addresses solely from this screen.

## Observed endpoint sequence

| Device | Configured Modbus TCP destination | Unit ID |
|---|---|---|
| Feed 1 | `192.168.95.10:502` | 247 |
| Feed 2 | `192.168.95.11:502` | 247 |
| Purge | `192.168.95.12:502` | 247 |
| Product | `192.168.95.13:502` | 247 |
| Tank | `192.168.95.14:502` | 247 |

Each entry is a separately configured network endpoint. No success/failure determination of actual traffic follows from these settings.

## Interpretation

**Verified:** Tank's configured Modbus TCP endpoint, Unit ID and register quantities are visible on the OpenPLC screen.

**Not verified:** TCP reachability, successful Modbus polling, device identity on the network, actual process value definitions, or that Tank is currently connected.

**Next:** Review the remaining Analyzer configuration without saving changes, then plan safe read-only connectivity validation and a packet-capture baseline.

## Screenshot to upload

`E11-20261121-tank-modbus-config.png` — save and upload the original lab screenshot to the same evidence folder, then link it to this report.
