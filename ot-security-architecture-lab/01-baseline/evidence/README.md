# Phase 1 evidence directory

No evidence files have been uploaded yet. The November 7 observations come from live screenshots/output and are described in the session notes.

## Capture **during** each test
- E01-YYYYMMDD-docker-containers.png — all running services and ports, immediately after startup.
- E02-YYYYMMDD-simulation-dashboard.png — process simulator status, before any control changes.
- E03-YYYYMMDD-hmi-T0.png — first process measurement snapshot.
- E04-YYYYMMDD-hmi-T1.png — second reading about 60 seconds later.
- E05-YYYYMMDD-plc-runtime.png — PLC management/status display, without exposing credentials.
- E06-YYYYMMDD-terminal-redacted.txt — relevant command output with timestamps.
- E07-YYYYMMDD-hmi-recovery.png — if incident reproduces, sanitized before/after evidence.

Use screenshot names as references in test-results.csv and observations. Add readable cropped evidence and explain what each image proves. Do not upload credentials, tokens, browser profiles, employer production configurations, or captures from non-lab systems. Review and sanitize PCAPs before publishing them in Phase 3.
