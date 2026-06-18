#!/usr/bin/env bash
set -u

# ot_retry_sim.sh
# Purpose: Simulate an OT/IIoT device retrying a downed local service, such as an MQTT broker.
# Safety: Uses an unreachable private IP and sends no payload, exploit, scan, or malware.

DEST_IP="192.168.56.250"       # Example unreachable private/host-only lab IP
DEST_PORT="1883"               # MQTT broker port
INTERVAL_SECONDS="60"          # Regular OT retry/polling style interval
DURATION_MINUTES="20"          # Lab runtime target
LOG_FILE="../logs/ot_retry_sim.log"
SERVICE_LABEL="mqtt-broker"
LABEL="ot-service-retry"

mkdir -p "$(dirname "$LOG_FILE")"

echo "# OT retry simulation started: $(date -Is)" | tee -a "$LOG_FILE"
echo "# destination=${DEST_IP}:${DEST_PORT} interval=${INTERVAL_SECONDS}s duration=${DURATION_MINUTES}m service=${SERVICE_LABEL} label=${LABEL}" | tee -a "$LOG_FILE"

END_TIME=$(( $(date +%s) + (DURATION_MINUTES * 60) ))

while [ "$(date +%s)" -lt "$END_TIME" ]; do
    TS="$(date -Is)"

    # Harmless TCP connect check only. No payload is sent.
    if timeout 5 bash -c "</dev/tcp/${DEST_IP}/${DEST_PORT}" 2>/dev/null; then
        RESULT="connected"
    else
        RESULT="connection_failed_or_timed_out"
    fi

    echo "${TS} label=${LABEL} service=${SERVICE_LABEL} dest_ip=${DEST_IP} dest_port=${DEST_PORT} protocol=tcp result=${RESULT}" | tee -a "$LOG_FILE"
    sleep "$INTERVAL_SECONDS"
done

echo "# OT retry simulation ended: $(date -Is)" | tee -a "$LOG_FILE"
