# E09 — Purge Modbus TCP configuration

**Observation date:** November 21, 2026  
**Source:** Screenshot supplied from the OpenPLC **Edit slave device** screen for **Purge**, in the isolated GRFICSv3 lab.  
**Method:** Read-only inspection. No changes or saves reported.
**Screenshot status:** [Purge screenshot uploaded](E09-20261121-purge-modbus-config.png).

## Configured endpoint

| Field | Observation |
|---|---|
| Device | Purge |
| Type | Generic Modbus TCP Device |
| IP address | `192.168.95.12` |
| TCP port | `502` |
| Slave / Unit ID | `247` |
| Discrete inputs | Start 0; size 0 |
| Coils | Start 0; size 0 |
| Input registers | Start 1; size 2 |
| Holding registers — read | Start 0; size 0 |
| Holding registers — write | Start 1; size 1 |

The Edit screen labels the input / write mapping sections `%IW100` and `%QW100`. The earlier *Slave Devices* list showed the aggregate allocations for Purge as **`%IW104–%IW105`** and **`%QW102`**. These are recorded as distinct display contexts; verifying how OpenPLC derives mappings is a separate check. Do not treat interface headings as observed packet register offsets.

## Comparison and interpretation

Three configured Modbus TCP endpoints have now been observed:

| Device | Endpoint | Unit ID |
|---|---|---|
| Feed 1 | `192.168.95.10:502` | 247 |
| Feed 2 | `192.168.95.11:502` | 247 |
| Purge | `192.168.95.12:502` | 247 |

These are distinct endpoint addresses using the same Modbus Unit ID. That does not alone establish a conflict. The sequential IP addresses are a *configuration pattern*, not evidence of other uninspected device IPs.

**Verified:** Purge is configured for Modbus TCP at `192.168.95.12:502`, Unit ID 247, with two input registers and one writable holding register in the device form.

**Not verified:** Endpoint reachability, successful Modbus polling, function codes, payload/physical process meaning, or exact packet-level register offsets.

## Evidence to upload

`E09-20261121-purge-modbus-config.png` — original OpenPLC screenshot in the same evidence directory. [Screenshot published beside this report](E09-20261121-purge-modbus-config.png).

**Next:** Inspect Product, Tank, and Analyzer endpoint settings without saving changes. Then validate actual data paths later using read-only network/packet tests.
