#!/usr/bin/env bash
set -u

# beacon_sim.sh
# Purpose: Simulate C2-like beacon timing using harmless timed connection attempts.
# Safety: Uses documentation/test IP space and sends no payload, exploit, scan, or malware.

DEST_IP="203.0.113.10"          # RFC 5737 TEST-NET-3 documentation address
DEST_PORT="443"                # Common outbound HTTPS port
INTERVAL_SECONDS="60"          # Regular interval to mimic beacon timing
DURATION_MINUTES="20"          # Lab runtime target
LOG_FILE="../logs/beacon_sim.log"
LABEL="simulated-c2-beacon"

mkdir -p "$(dirname "$LOG_FILE")"

echo "# Beacon simulation started: $(date -Is)" | tee -a "$LOG_FILE"
echo "# destination=${DEST_IP}:${DEST_PORT} interval=${INTERVAL_SECONDS}s duration=${DURATION_MINUTES}m label=${LABEL}" | tee -a "$LOG_FILE"

END_TIME=$(( $(date +%s) + (DURATION_MINUTES * 60) ))

while [ "$(date +%s)" -lt "$END_TIME" ]; do
    TS="$(date -Is)"

    # Harmless TCP connect check only. No payload is sent.
    if timeout 5 bash -c "</dev/tcp/${DEST_IP}/${DEST_PORT}" 2>/dev/null; then
        RESULT="connected"
    else
        RESULT="connection_failed_or_timed_out"
    fi

    echo "${TS} label=${LABEL} dest_ip=${DEST_IP} dest_port=${DEST_PORT} protocol=tcp result=${RESULT}" | tee -a "$LOG_FILE"
    sleep "$INTERVAL_SECONDS"
done

echo "# Beacon simulation ended: $(date -Is)" | tee -a "$LOG_FILE"
