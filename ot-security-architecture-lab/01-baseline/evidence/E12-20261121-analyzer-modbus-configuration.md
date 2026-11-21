# E12 — Analyzer Modbus TCP configuration

**Observed November 21, 2026.** Source: isolated GRFICSv3 OpenPLC **Edit slave device** screenshot supplied in the project conversation; reviewed read-only. **The original PNG is not yet uploaded to GitHub.**

## Configured fields

| Field | Value |
|---|---|
| Device name | Analyzer |
| Device type | Generic Modbus TCP Device |
| Slave / Unit ID | `247` |
| Configured IP | `192.168.95.15` |
| Configured port | TCP `502` |
| Discrete inputs | Start `0`, size `0` |
| Coils | Start `0`, size `0` |
| Input registers | Start `1`, size **`3`** |
| Holding registers — read | Start `0`, size `0` |
| Holding registers — write | Start `1`, size `1` |

The input-register quantity **differs from Feed 1, Feed 2, Purge, Product and Tank**, each of which is configured with two input registers. The aggregate OpenPLC Slave Devices summary showed **`%IW110–%IW112`** and **`%QW105`** assigned for Analyzer. The Edit page's section headings display `%IW100` and `%QW100`; these are not, on their own, proven packet-level Modbus register addresses.

## Engineering interpretation

**Verified as configuration:** Analyzer's endpoint is `192.168.95.15:502`, Unit ID `247`; its configured input register count is three, and its write holding register count is one.

**Runtime evidence from a separate screenshot:** The PLC runtime log included `Connected to MB device Analyzer` during a prior session. That is positive evidence of a connection event but does not establish continuous availability or successful measurement exchange at this moment.

**Unverified:** Whether Modbus requests succeed now, live values and their meaning, network routes and complete PLC-to-process information flow.

## Required screenshot

Upload `E12-20261121-analyzer-modbus-config.png` beside this report, then update the image link. No PNG is claimed present until its GitHub upload is verified.

**Next phase-1 step:** Confirm active paths without changing field values or PLC logic, using passive or minimally intrusive observations.
