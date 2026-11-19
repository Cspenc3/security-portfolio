# E05 — OpenPLC runtime dashboard: initial observation

**Date:** November 18, 2026  
**Source:** Screenshot supplied during Phase 1 Checkpoint 4. Screenshot is now present: [E05 OpenPLC runtime](E05-20261118-plc-runtime.png).
**Scope:** Read-only observation of GRFICSv3 OpenPLC management dashboard.

## Verified dashboard fields

- Application: OpenPLC Web Interface.
- Status: **Running** (shown in green).
- Program: **Chemical Reactor**.
- Program file: `326339.st`.
- Runtime value displayed: `3705` (unit not established from screenshot).
- Runtime output shows `OpenPLC Runtime starting...` and `Interactive Server: Listening on port 43628`.

## Runtime log messages visible in the screenshot

- `Device Feed 1 is disconnected. Attempting to reconnect...` followed by `Connection failed on MB device Feed 1: Connection refused`
- Similar **connection refused** messages are shown for **Feed 2, Purge, Product, Tank**.
- `Device Analyzer is disconnected. Attempting to reconnect...` is visible; its subsequent connection outcome is **not visible** in this screenshot.
- `Persistent Storage is empty` appears in the visible excerpt.

## Interpretation and limitations

**Verified:** The PLC runtime reports Running with a Chemical Reactor program loaded. Its visible log excerpt records failed connection attempts to several named **MB** devices at some point in the log history.

**Not verified:** Whether these failures are still happening or occurred only during startup. The screenshot shows neither the latest log entries nor timestamps for each message. A Running PLC process does not prove that its connected devices are online. Conversely, historical startup errors do not prove a current outage.

**Hypotheses to test:** Some devices may not have been ready when the controller started, or connection settings/network paths may be incorrect. These are not established root causes.

**Relationship to E03–E04:** SCADA-LTS displayed changing process values. This does not independently confirm which devices or protocols supplied those values; investigate rather than treating the two observations as contradictory proof.

## Next read-only test

Scroll **inside the Runtime Logs panel** to the very bottom. Capture the newest log lines and determine whether they show successful reconnections, continued refusal or something else. Do not stop the PLC, upload logic, modify Slave Devices or change settings.

## Screenshot to upload

[E05-20261118-plc-runtime.png](E05-20261118-plc-runtime.png) — uploaded screenshot of PLC dashboard and visible first log excerpt. A follow-up screenshot of the **bottom of the log** may be named `E05b-20261118-plc-latest-logs.png`.

**Update (November 19):** [Later runtime log excerpt E05b](E05b-20261119-plc-latest-logs-observation.md) shows an Analyzer reconnection and Modbus client activity. Other device connection states remain unverified.

**Status:** Checkpoint 4 partially completed; PLC runtime status observed, device communications not fully verified.
