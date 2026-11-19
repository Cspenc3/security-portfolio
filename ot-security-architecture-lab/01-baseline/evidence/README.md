# Phase 1 evidence directory

## Verified, published evidence — November 18, 2026

| Checkpoint | Screenshot | Written observations |
|---|---|---|
| E01 — Container inventory | [Docker containers](E01-20261118-docker-containers.png) | [Startup transcript](E01-20261118-docker-inventory-transcript.md) |
| E02 — Plant simulator | [GRFICS process dashboard](E02-20261118-simulation-dashboard.png) | [Simulator observation](E02-20261118-simulation-observation.md) |
| E03 — Initial HMI reading | [SCADA-LTS T0](E03-20261118-hmi-T0.png) | [T0/T1 comparison](E03-E04-20261118-hmi-comparison.md) |
| E04 — Subsequent HMI reading | [SCADA-LTS T1](E04-20261118-hmi-T1.png) | [T0/T1 comparison](E03-E04-20261118-hmi-comparison.md) |

All four PNG files were confirmed present in this folder. The observation reports explain what the evidence supports and what remains unverified.

## Upcoming checks

- E05 — [PLC runtime observation](E05-20261118-plc-runtime-observation.md) recorded; **dashboard PNG not yet uploaded**. [Follow-up log excerpt E05b](E05b-20261119-plc-latest-logs-observation.md) confirms Analyzer reconnect and Modbus client activity; communication health remains partially verified. **Neither E05 nor E05b PNG has been uploaded yet.**
- E06 — [Slave-device inventory observation](E06-20261119-slave-device-inventory-observation.md): six configured TCP devices and mapped OpenPLC analog I/O ranges. The PNG `E06-20261119-slave-device-inventory.png` still needs upload; connection endpoint and live health checks remain outstanding.
- E07 — Controller/device network endpoint and communication verification, appropriately redacted.
- Additional evidence only when associated tests are actually performed.

## Publication rules

All screenshots and captures must originate from the isolated lab. Do not upload passwords, tokens, personal details, employer configurations, non-lab network captures or sensitive process information. Keep observed facts distinct from inference and clearly label unresolved issues.
