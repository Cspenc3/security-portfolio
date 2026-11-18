# E02 — Chemical plant simulation dashboard (observation transcript)

**Date:** November 18, 2026  
**Source:** Screenshot provided by project owner during a browser-based observation of the isolated GRFICSv3 lab. Original image remains in the working conversation and has **not yet been uploaded to GitHub**.

## What was visible

- GRFICSv3 Lab dashboard, **Chemical Plant Simulation** (3D plant visualization) loaded successfully.
- Left dashboard displayed a green indicator and the label **Simulation running**.
- Attacker workstation indicator showed **Reachable** (green).
- Defender workstation indicator showed **Reachable** (green).
- Caldera indicator showed **Starting...** (yellow).
- Wazuh SIEM indicator showed **Starting...** (yellow).
- Top overlay displayed **Physical Vulnerabilities Found: 0/9**. This is a lab objective/challenge counter, not a verified security assessment.
- Process reactor, pipes and related visual elements rendered.

## Assessment

**Phase 1 Checkpoint 2: PASS for simulation web-access and visualization.**  
**Limitations:** Image does not establish SCADA/HMI controller data exchange, process-value freshness, readiness of Caldera or Wazuh, or actual system security. Docker health-check state and app startup indicators can differ.

## Evidence status and follow-up

A screenshot was presented in the working session but the raw file has not been committed. Add a sanitized copy to this directory as `E02-20261118-simulation-dashboard.png` when convenient.

**Next checkpoint:** Access SCADA-LTS on `http://localhost:6081`, record T0 pressure/level/flow/mode and a second T1 reading approximately 60 seconds later without touching controls.
