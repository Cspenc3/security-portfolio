# E03–E04 — SCADA-LTS process baseline comparison

**Date:** November 18, 2026  
**Source:** Two screenshots of GRFICSv3 SCADA-LTS graphic view `TenEastView1` supplied during the working session. The exact capture times and interval are not visible in the screenshots.  
**Scope:** Read-only HMI observation. No valve, setpoint or manual control changes reported.

## Observations

| Parameter | T0 (E03) | T1 (E04) | Change |
|---|---:|---:|---:|
| Reactor pressure (kPa) | 2696.7 | 2701.8 | +5.1 |
| Reactor level (%) | 43.9 | 44.1 | +0.2 percentage points |
| Feed 1 flow (kmol/h) | 642.2 | 642.2 | 0.0 |
| Feed 2 flow (kmol/h) | 0.0 | 0.0 | 0.0 |
| Product flow (kmol/h) | 134.0 | 195.5 | +61.5 |
| Purge flow (kmol/h) | 0.0 | 508.2 | +508.2 |
| Product valve indicated position (%) | 63.1 | 91.9 | +28.8 percentage points |
| Purge valve indicated position (%) | 0.0 | 28.3 | +28.3 percentage points |
| Manual mode | OFF | OFF | No change |
| Process status indicator | RUNNING | RUNNING | No change |

The HMI also displayed feed 1 valve position at 100.0% and feed 2 valve position at 0.0% in both captures. Values tagged as `*ManualSP` are labeled manual setpoints and should not be mistaken for actual valve positions.

## Interpretation

**Verified from screenshots:** SCADA-LTS interface was accessible, and its displayed pressure, level, product/purge flows and indicated valve positions differed between observations. The display remained in automatic mode with a RUNNING status indication.

**Supported inference:** Process values on the HMI are not all static; there is evidence of changing displayed telemetry and/or simulation values. The purge and product flow changes coincide with changes in indicated valve positions. These two snapshots alone do not establish causality or timing precision.

**Not yet verified:** Exact data source, PLC runtime/logic state, actual HMI-to-controller protocol traffic, controller-to-simulation data path, whether values represent fresh physical process measurements, or overall process safety. Do not claim PLC data flow is validated until a separate controller and communication check is performed.

## Evidence publication

- **E03:** `E03-20261118-hmi-T0.png` — initial observed display, needs GitHub upload.
- **E04:** `E04-20261118-hmi-T1.png` — subsequent observed display, needs GitHub upload.

Original screenshots were shared in the working conversation but **are not yet published in this evidence folder**. Upload both sanitized images, then link them directly here.

## Next verification

Verify SCADA-LTS data-source settings and controller management status read-only, then establish whether the simulated controller and HMI communicate as designed.
