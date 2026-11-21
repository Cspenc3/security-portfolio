# Phase 1 — Technical Evidence Appendix

**Start with the illustrated [Phase 1 engineering case study](../README.md).** It explains the assessment, methods and findings on one page; individual evidence files below are for reproducibility and technical review.

**Evidence rule:** A screenshot demonstrates only what was visible at that observation time. Configuration, assigned addresses, listeners, established TCP sessions and valid Modbus application transactions are **different levels of proof**.

## Evidence grouped by the engineering question

<details>
<summary><strong>1. Did the industrial environment start, and were process values observable? — E01–E04</strong></summary>

| Evidence | Original image | Analysis / transcript |
|---|---|---|
| E01 — Container health and host ports | [Screenshot](E01-20261118-docker-containers.png) | [Startup inventory](E01-20261118-docker-inventory-transcript.md) |
| E02 — Chemical process visualization | [Screenshot](E02-20261118-simulation-dashboard.png) | [Simulator observation](E02-20261118-simulation-observation.md) |
| E03 — SCADA-LTS initial values | [T0 screenshot](E03-20261118-hmi-T0.png) | [T0 / T1 comparison](E03-E04-20261118-hmi-comparison.md) |
| E04 — SCADA-LTS later values | [T1 screenshot](E04-20261118-hmi-T1.png) | [T0 / T1 comparison](E03-E04-20261118-hmi-comparison.md) |

**Finding:** Seven containers reported healthy, the simulation loaded, and HMI display values changed. This does **not** validate physical process measurements or Modbus payloads.

</details>

<details>
<summary><strong>2. Was the controller running, and what did its logs and field-device mapping show? — E05–E06</strong></summary>

| Evidence | Original image | Analysis |
|---|---|---|
| E05 — OpenPLC runtime and connection errors | [Initial runtime screenshot](E05-20261118-plc-runtime.png) | [Initial runtime findings](E05-20261118-plc-runtime-observation.md) |
| E05b — Later Analyzer connection and clients | [Later logs screenshot](E05b-20261119-plc-latest-logs.png) | [Follow-up findings](E05b-20261119-plc-latest-logs-observation.md) |
| E06 — Six configured slave devices / memory allocations | [Device list screenshot](E06-20261119-slave-device-inventory.png) | [I/O mapping inventory](E06-20261119-slave-device-inventory-observation.md) |

**Finding:** PLC runtime reported Running; earlier connection refusals were followed by later connection activity. This does not establish whether all devices are currently exchanging valid process data.

</details>

<details>
<summary><strong>3. Which six device endpoints were configured? — E07–E12</strong></summary>

All six use configured Modbus TCP port `502` and Unit ID `247`. See the [one-page endpoint and register inventory](../modbus-endpoint-inventory.md) instead of opening six screenshots to determine the mappings.

| Logical device | Configured destination | Original screenshot | Detailed record |
|---|---|---|---|
| Feed 1 (E07) | `192.168.95.10:502` | [Image](E07-20261119-feed1-modbus-config.png) | [Config](E07-20261119-feed1-modbus-configuration.md) |
| Feed 2 (E08) | `192.168.95.11:502` | [Image](E08-20261121-feed2-modbus-config.png) | [Config](E08-20261121-feed2-modbus-configuration.md) |
| Purge (E09) | `192.168.95.12:502` | [Image](E09-20261121-purge-modbus-config.png) | [Config](E09-20261121-purge-modbus-configuration.md) |
| Product (E10) | `192.168.95.13:502` | [Image](E10-20261121-product-modbus-config.png) | [Config](E10-20261121-product-modbus-configuration.md) |
| Tank (E11) | `192.168.95.14:502` | [Image](E11-20261121-tank-modbus-config.png) | [Config](E11-20261121-tank-modbus-configuration.md) |
| Analyzer (E12) | `192.168.95.15:502` | [Image](E12-20261121-analyzer-modbus-config.png) | [Config](E12-20261121-analyzer-modbus-configuration.md) |

**Finding:** Six destinations identified; Analyzer has three configured input words, compared with two for the other five. OpenPLC memory mappings are not automatically packet-level register offsets.

</details>

<details>
<summary><strong>4. Where do the addresses live, and are TCP services listening? — E13–E16</strong></summary>

| Evidence | Original image | Analysis |
|---|---|---|
| E13 — PLC: admin `172.18.0.5`; ICS `192.168.95.2` | [Screenshot](E13-20261121-plc-network-membership.png) | [Network membership](E13-20261121-plc-network-membership.md) |
| E14 — Simulation: admin `172.18.0.7`; ICS `192.168.95.45` | [Screenshot](E14-20261121-simulation-network-membership.png) | [Network membership](E14-20261121-simulation-network-membership.md) |
| E15 — All six Modbus destination IPs are aliases on simulation `eth0` | [Screenshot](E15-20261121-simulation-ip-aliases.png) | [IP alias analysis](E15-20261121-simulation-ip-alias-discovery.md) |
| E16 — Six TCP 502 listeners on those addresses | [Screenshot](E16-20261121-modbus-tcp-listeners.png) | [Listener analysis](E16-20261121-modbus-tcp-listeners.md) |

**Follow-up observation:** A later `ss -tn` snapshot showed six established TCP sessions from PLC `192.168.95.2` to the configured device endpoints. The original session screenshot remains in the working conversation and **has not yet been committed to GitHub**. The finding is summarized transparently in the [Phase 1 case study](../README.md).

**Finding:** Device addresses are logical endpoints inside one simulation container. TCP listeners and established sessions were observed, but Modbus payloads have not been decoded.

</details>

## Other supporting records

- [Full network inventory](../network-inventory.csv)
- [Test-results ledger](../test-results.csv)
- [Initial technical runbook](../technical-runbook.md)
- [Conceptual architecture figure](../diagrams/grficsv3-phase-01-high-level-topology.png)

**Publication safeguards:** All evidence must come from the isolated lab. Do not upload employer networks, live credentials, tokens, private machine information or external packet captures. Preserve failed tests and outstanding questions alongside successful results.
