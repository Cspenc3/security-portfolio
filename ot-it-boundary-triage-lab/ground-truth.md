# Ground Truth Reveal

> Do not read this file until the blind triage worksheet is complete.

## Lab Traffic Sources

This lab generates two timed traffic patterns from the same Ubuntu VM. Both patterns repeat at approximately 60-second intervals to create ambiguity at the network layer.

| Script | Intended Scenario | Destination | Port | Label | Log File |
|---|---|---:|---:|---|---|
| `beacon_sim.sh` | Simulated C2-style beacon timing | `203.0.113.10` | `443/tcp` | `simulated-c2-beacon` | `logs/beacon_sim.log` |
| `ot_retry_sim.sh` | OT/IIoT device retrying a downed MQTT broker | `192.168.56.250` | `1883/tcp` | `ot-service-retry`, `service=mqtt-broker` | `logs/ot_retry_sim.log` |

## Expected Pattern

Both scripts should produce repeated connection attempts every 60 seconds for about 15–20 minutes.

The beacon simulation is designed to look like suspicious regular outbound communication. The OT retry simulation is designed to look like an industrial device or service repeatedly trying to reach a failed dependency.

## Why This Is Ambiguous

Regular intervals alone are not enough to prove malicious behavior. Malware beaconing, OT polling, backup jobs, monitoring agents, time sync failures, and application retries can all produce repeated network attempts.

The analyst must avoid treating timing alone as proof. A stronger conclusion requires context such as asset role, expected communication baseline, zone/segment rules, known service dependencies, change records, allowlists, and host logs.

## Comparison Steps

After completing blind triage:

1. Compare observed destination IPs and ports against the table above.
2. Compare packet timestamps against each script log.
3. Note which hypothesis was correct, incorrect, or low confidence.
4. Identify which evidence was actually useful.
5. Identify which evidence was misleading.
6. Update the final report with an accuracy assessment.
