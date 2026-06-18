# OT/IT Boundary Triage Report

## Objective

Document a simulated network triage exercise comparing two repeated traffic patterns: one representing C2-style beacon timing and one representing benign OT/IIoT retry behavior. The goal is not to prove an attack occurred. The goal is to demonstrate disciplined analysis of ambiguous network behavior.

## Methodology

Describe the lab environment, VM setup, scripts used, capture interface, capture duration, and Wireshark filters used.

- Lab host:
- Capture tool:
- Capture file:
- Capture start/end:
- Scripts executed:
- Filters used:

## Capture Setup

Explain how both scripts were run concurrently and how the packet capture was collected.

Example commands:

```bash
cd ot-it-boundary-triage-lab/scripts
chmod +x beacon_sim.sh ot_retry_sim.sh
./beacon_sim.sh &
./ot_retry_sim.sh &
```

## Blind Analysis Summary

Link to completed worksheet:

- [Blind triage worksheet](./blind-triage-worksheet.md)

Summarize what was observed before reviewing ground truth.

## Ground Truth Reveal

Link to ground truth:

- [Ground truth](./ground-truth.md)

Summarize which traffic pattern came from each script and compare against the blind triage findings.

## Accuracy Assessment

| Flow | Blind Hypothesis | Actual Source | Correct? | Reasoning |
|---|---|---|---|---|
| Flow 1 |  |  |  |  |
| Flow 2 |  |  |  |  |

### What I Got Right

-

### What I Got Wrong or Had Low Confidence On

-

### Misleading Signals

-

## OT/SRE Disambiguation

At the network layer, malicious beaconing and benign OT polling or retry behavior can look similar. Both may use fixed intervals, repeated connection attempts, small packet sizes, and limited payload visibility. In isolation, a 60-second repeated connection pattern may suggest command-and-control behavior, but it may also represent an industrial device retrying a failed service dependency such as MQTT, NTP, historian communication, or a vendor application endpoint.

In OT environments, this ambiguity matters because many systems are designed to communicate on predictable schedules. PLCs, sensors, HMIs, historians, gateways, and monitoring agents may poll or retry at fixed intervals. A SOC analyst who treats every repeated interval as malicious can create false positives and disrupt operations. At the same time, dismissing regular traffic as normal can miss real beaconing activity.

Useful context for resolving the ambiguity includes:

- **Asset inventory:** What is the host? Is it a workstation, PLC, sensor gateway, HMI, jump box, or server?
- **Known service dependencies:** Is the destination a documented broker, historian, time server, vendor endpoint, or management service?
- **Protocol allowlists:** Is this protocol expected from this asset type and network zone?
- **Expected communication baselines:** Has this host communicated this way historically, or is the pattern new?
- **Segmentation and zone awareness:** Does the source-to-destination path violate expected OT/IT boundaries?
- **Maintenance windows and change records:** Did the traffic start after a planned change, outage, patch, or device replacement?
- **Firewall and proxy logs:** Are connections allowed, denied, or newly blocked?
- **Endpoint and application logs:** Is a service failing locally, retrying, or generating errors at the same timestamp?
- **Vendor/system documentation:** Does the vendor define this polling interval or retry behavior?

The key lesson is that packet timing is a starting point, not a verdict. The analyst should use network evidence to form a hypothesis, then validate it with operational context before escalating or closing the event.

## Lessons Learned

-

## Recommended Next Steps

-

## Evidence Bundle

- PCAP:
- Script logs:
- Screenshots:
- Worksheet:
- Ground truth:
