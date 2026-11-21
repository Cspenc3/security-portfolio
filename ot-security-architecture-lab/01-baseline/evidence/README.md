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

- E05 — [Initial PLC dashboard screenshot](E05-20261118-plc-runtime.png) + [runtime investigation](E05-20261118-plc-runtime-observation.md); [E05b later log screenshot](E05b-20261119-plc-latest-logs.png) + [findings](E05b-20261119-plc-latest-logs-observation.md). Both screenshots uploaded; some device statuses remain unverified.
- E06 — [Uploaded Slave Devices screenshot](E06-20261119-slave-device-inventory.png) and [written inventory findings](E06-20261119-slave-device-inventory-observation.md): six configured TCP devices and OpenPLC analog I/O ranges. Endpoints and live health still need verification.
- E07 — [Feed 1 configuration screenshot](E07-20261119-feed1-modbus-config.png) and [written Modbus TCP endpoint findings](E07-20261119-feed1-modbus-configuration.md). Configured endpoint `192.168.95.10:502`, Unit ID 247; live communications not yet verified.
- E08 — [Feed 2 screenshot](E08-20261121-feed2-modbus-config.png) and [Modbus configuration findings](E08-20261121-feed2-modbus-configuration.md), configured target `192.168.95.11:502`, Unit ID 247; no live traffic verified.
- E09 — [Purge configuration findings](E09-20261121-purge-modbus-configuration.md), configured endpoint `192.168.95.12:502`, Unit ID 247. PNG screenshot pending upload.
- Additional evidence only when associated tests are actually performed.

## Publication rules

All screenshots and captures must originate from the isolated lab. Do not upload passwords, tokens, personal details, employer configurations, non-lab network captures or sensitive process information. Keep observed facts distinct from inference and clearly label unresolved issues.
