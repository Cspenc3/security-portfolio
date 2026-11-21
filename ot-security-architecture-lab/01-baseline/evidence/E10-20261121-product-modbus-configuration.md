# E10 — Product Modbus TCP endpoint configuration

**Observation date:** November 21, 2026  
**Source:** User-supplied OpenPLC **Edit slave device** screen for the Product device in the isolated GRFICSv3 chemical plant simulation.  
**Method:** Read-only observation. **Actual PNG not yet uploaded to GitHub.**

## Observed configured values

| Property | Value |
|---|---|
| Device name | Product |
| Device type | Generic Modbus TCP Device |
| Slave / Unit ID | `247` |
| IP address | `192.168.95.13` |
| Port | TCP `502` |
| Discrete inputs | Start address `0`, size `0` |
| Coils | Start address `0`, size `0` |
| Input registers | Start address `1`, size `2` |
| Holding registers — read | Start address `0`, size `0` |
| Holding registers — write | Start address `1`, size `1` |

The per-device Edit page displays generic memory section labels `%IW100` and `%QW100`. The previously observed OpenPLC **Slave Devices** summary allocates Product to `%IW106–%IW107` and `%QW103`. The page headings and aggregate controller memory allocations are recorded separately; the precise mapping to packet-level Modbus register offsets and process-variable meaning has **not been validated**.

## Endpoint inventory progression

| Configured device | Destination | Unit ID | Connectivity status |
|---|---|---|---|
| Feed 1 | `192.168.95.10:502` | `247` | Not yet individually tested |
| Feed 2 | `192.168.95.11:502` | `247` | Not yet individually tested |
| Purge | `192.168.95.12:502` | `247` | Not yet individually tested |
| Product | `192.168.95.13:502` | `247` | Not yet individually tested |

**Verified:** Product is configured as a Modbus TCP device on the ICS subnet at `192.168.95.13:502`, with Unit ID `247` and the register configuration shown above.

**Not yet verified:** Successful TCP connection, valid Modbus transactions, the identity of the process value(s), live process effects, and the endpoint settings of Tank and Analyzer.

## Evidence to upload

`E10-20261121-product-modbus-config.png` — screenshot captured from the Product edit page. Place it in this directory and update the link once uploaded.

**Next:** Inspect Tank and Analyzer configuration pages without modifying or saving anything; establish an inventory before performing controlled network verification.
