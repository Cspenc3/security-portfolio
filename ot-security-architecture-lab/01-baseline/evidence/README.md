# Phase 1 evidence directory

An E03–E04 HMI comparison report has been published as [E03–E04 process observations](E03-E04-20261118-hmi-comparison.md). The actual E03 and E04 PNG files have **not yet been uploaded to GitHub**.

A November 18 startup screenshot was supplied during the working session but its original PNG has **not** been added to the GitHub repository. See [E01 transcript](E01-20261118-docker-inventory-transcript.md), a transcription of the observed PowerShell output; this is not an original screenshot. November 7 observations are described separately in session notes.

## Capture **during** each test
- E01-20261118-docker-containers.png — all running services and ports, immediately after startup.
- E02-YYYYMMDD-simulation-dashboard.png — process simulator status, before any control changes.
- E03-YYYYMMDD-hmi-T0.png — first process measurement snapshot.
- E04-YYYYMMDD-hmi-T1.png — second reading about 60 seconds later.
- E05-YYYYMMDD-plc-runtime.png — PLC management/status display, without exposing credentials.
- E06-YYYYMMDD-terminal-redacted.txt — relevant command output with timestamps.
- E07-YYYYMMDD-hmi-recovery.png — if incident reproduces, sanitized before/after evidence.

Use screenshot names as references in test-results.csv and observations. Add readable cropped evidence and explain what each image proves. Do not upload credentials, tokens, browser profiles, employer production configurations, or captures from non-lab systems. Review and sanitize PCAPs before publishing them in Phase 3.

- E02-20261118-simulation-observation.md — observed dashboard findings transcribed from screenshot supplied November 18; **PNG image is not yet published to GitHub**.
