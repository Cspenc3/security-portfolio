# E07 — Feed 1 Modbus TCP endpoint configuration

**Observation date:** November 19, 2026  
**Source:** Screenshot provided from the OpenPLC `Edit slave device` view for **Feed 1**. This was a read-only inspection; no configuration was changed.  
**Evidence status:** Original screenshot is in the working conversation; the PNG has not yet been uploaded to GitHub.

## Observed configuration

| Field | Configured value |
|---|---|
| Device name | Feed 1 |
| Device type | Generic Modbus TCP Device |
| Slave ID / Unit ID | 247 |
| IP address | `192.168.95.10` |
| TCP port | `502` |
| Discrete inputs (`%IX100.0`) | Start 0, size 0 (none allocated) |
| Coils (`%QX100.0`) | Start 0, size 0 (none allocated) |
| Input registers (`%IW100`) | Start 1, size 2, mapped to `%IW100–%IW101` |
| Holding registers — read (`%IW100`) | Start 0, size 0 (none allocated) |
| Holding registers — write (`%QW100`) | Start 1, size 1, mapped to `%QW100` |

## Findings

**Observed:** OpenPLC is *configured* to address the Feed 1 device at `192.168.95.10:502` using Modbus TCP and Unit ID 247. The device's two input words and one output word are allocated in the controller's internal I/O memory map.

**Not established:** Whether the endpoint is reachable, whether Modbus transactions succeed, whether the controller currently receives fresh measurements, or how those I/O words map to chemical process variables.

**Protocol interpretation caution:** `%IW` and `%QW` are OpenPLC I/O memory references; the displayed "Start Address 1" is a device configuration field. Do not assume packet-level register offsets, vendor 3xxxx/4xxxx notation, or function codes without a packet capture or documentation.

## Next step

Return to the Slave Devices list **without saving or changing any settings**, then inspect the Feed 2 device's network configuration. Repeat for the remaining devices to build an actual endpoint inventory. Validate traffic in a later phase.

## Screenshot to publish

Upload `E07-20261119-feed1-modbus-config.png` to this evidence folder and link it here. No screenshot has yet been uploaded to GitHub for E07.

**Status:** Endpoint configuration identified; actual connectivity not yet verified.
