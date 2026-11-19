# E06 — OpenPLC Slave Devices configuration inventory

**Observation date:** November 19, 2026  
**Source:** User-provided screenshot of the OpenPLC "Slave Devices" page from an isolated GRFICSv3 simulated chemical plant.  
**Method:** Read-only review; no changes made to configuration.  
**Evidence status:** Screenshot was shared in the project conversation but the PNG is **not yet uploaded to GitHub**.

## Device configuration observed

The page identifies slave devices as attached at address 100 onward and displays the following memory allocations.

| Device | Device type | Digital input (DI) | Digital output (DO) | Analog input (AI) | Analog output (AO) |
|---|---|---|---|---|---|
| Feed 1 | TCP | — | — | `%IW100` to `%IW101` | `%QW100` to `%QW100` |
| Feed 2 | TCP | — | — | `%IW102` to `%IW103` | `%QW101` to `%QW101` |
| Purge | TCP | — | — | `%IW104` to `%IW105` | `%QW102` to `%QW102` |
| Product | TCP | — | — | `%IW106` to `%IW107` | `%QW103` to `%QW103` |
| Tank | TCP | — | — | `%IW108` to `%IW109` | `%QW104` to `%QW104` |
| Analyzer | TCP | — | — | `%IW110` to `%IW112` | `%QW105` to `%QW105` |

## Interpretation

- All **six** devices are configured as TCP-type entries.
- There are no DI/DO allocations displayed in the device table.
- Each configured device has analog input words (`%IW`) and a single analog output word (`%QW`) assigned.
- `%IW` and `%QW` are OpenPLC memory addresses. These are **not automatically the same as Modbus protocol register numbers or physical device addresses**.
- The screenshot does not show each device's configured host/IP and port, or its current connectivity.
- Historical log refusals and subsequent Analyzer connection are separate runtime observations. Configured entries alone do **not** confirm active communication.

## Engineering significance

This is a usable starting point for controller asset relationships and later protocol validation. Future work can associate **actual** network endpoints, observed Modbus function codes and register values (if present), and relevant process behavior with each configured device without guessing the mapping.

## Next safe verification

Read-only: inspect one device's detailed settings without saving changes to identify its configured network destination/port, if displayed. Alternately, use a read-only network/container inspection to establish the device mapping without modifying any settings. Once an endpoint is verified, repeat for remaining devices and compare with network observations.

## Image to upload

`E06-20261119-slave-device-inventory.png`

After uploading, link it directly here and in the Phase 1 evidence index.

**Finding:** Configured slave-device inventory verified. **Communication health and destination endpoints:** not yet verified.
