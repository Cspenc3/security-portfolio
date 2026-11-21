# Phase 1 — Configured Modbus TCP device endpoint inventory

**Scope:** Read-only findings from the **six** configured slave devices in the GRFICSv3 OpenPLC interface. Screenshots E07–E12 are now uploaded alongside their individual analyses. The table records **configuration**, not proof of active Modbus communications. All values were observed on individual device pages and corroborated against the Slave Devices summary for OpenPLC I/O allocation.

| Device | Configured destination | Unit ID | Input registers: start / qty | Write holding: start / qty | OpenPLC input words (summary) | OpenPLC output word (summary) | Evidence |
|---|---|---:|---|---|---|---|---|
| Feed 1 | `192.168.95.10:502` | 247 | 1 / 2 | 1 / 1 | `%IW100–101` | `%QW100` | [E07](evidence/E07-20261119-feed1-modbus-configuration.md) |
| Feed 2 | `192.168.95.11:502` | 247 | 1 / 2 | 1 / 1 | `%IW102–103` | `%QW101` | [E08](evidence/E08-20261121-feed2-modbus-configuration.md) |
| Purge | `192.168.95.12:502` | 247 | 1 / 2 | 1 / 1 | `%IW104–105` | `%QW102` | [E09](evidence/E09-20261121-purge-modbus-configuration.md) |
| Product | `192.168.95.13:502` | 247 | 1 / 2 | 1 / 1 | `%IW106–107` | `%QW103` | [E10](evidence/E10-20261121-product-modbus-configuration.md) |
| Tank | `192.168.95.14:502` | 247 | 1 / 2 | 1 / 1 | `%IW108–109` | `%QW104` | [E11](evidence/E11-20261121-tank-modbus-configuration.md) |
| Analyzer | `192.168.95.15:502` | 247 | **1 / 3** | 1 / 1 | `%IW110–112` | `%QW105` | [E12](evidence/E12-20261121-analyzer-modbus-configuration.md) |

**No discrete input or coil allocations** appeared on these six edit screens. All six showed holding-register read size 0. Each uses the same Unit ID on a distinct IP address, which does not itself establish a conflict.

## Findings and limits

1. Six **unique** configured endpoints lie in the `192.168.95.0/24` address range and use TCP port 502. Do not infer actual container memberships or ACL permissions from subnet labels alone.
2. Analyzer is allocated **three input words**; the other five are allocated two each. This is the only observed register-*quantity* difference.
3. The edit screens have generic `%IW100` and `%QW100` section headings even where the summary table allocates different word addresses. Exact mapping from these fields to **on-wire Modbus register offsets/function codes** has not been demonstrated.
4. Earlier OpenPLC startup logs contained connection refusals; a later log excerpt showed an Analyzer connection and Modbus client activity. Historical log evidence does not establish continuous healthy data exchange across all six devices.
5. **Next engineering question:** Does the PLC actually communicate successfully with these configured destinations, and what process data is carried? Validate using passive network/container observation, and later packet evidence with protocol dissection.

**Project continuity:** These records inform the existing [high-level topology](diagrams/grficsv3-phase-01-high-level-topology.png). We will update it after network tests rather than invent links or building the Cisco Packet Tracer model prematurely.
