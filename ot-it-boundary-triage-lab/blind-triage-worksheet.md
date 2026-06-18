# Blind Triage Worksheet

> Complete this worksheet before reviewing script logs or `ground-truth.md`.

## Analyst Information

- Analyst:
- Date:
- Start time:
- End time:
- PCAP file name:
- Wireshark version:
- VM / host notes:

## Capture Scope

- Capture interface:
- Capture duration:
- Known lab constraints:
- What I am intentionally not allowed to review yet:

## Flow 1 Observation

- First observed timestamp:
- Last observed timestamp:
- Source IP:
- Destination IP:
- Destination port:
- Protocol:
- Approximate interval:
- Interval regularity: regular / irregular / unknown
- Payload or protocol characteristics:
- DNS behavior observed before connection attempt:
- Packet size pattern:
- Connection result pattern:

### Flow 1 Hypothesis

- Initial hypothesis: malicious / operational retry / misconfiguration / unknown
- Confidence level: high / medium / low
- Evidence supporting hypothesis:
- Evidence against hypothesis:
- Analyst decision: escalate / monitor / close as benign / request more context
- Additional context needed:

## Flow 2 Observation

- First observed timestamp:
- Last observed timestamp:
- Source IP:
- Destination IP:
- Destination port:
- Protocol:
- Approximate interval:
- Interval regularity: regular / irregular / unknown
- Payload or protocol characteristics:
- DNS behavior observed before connection attempt:
- Packet size pattern:
- Connection result pattern:

### Flow 2 Hypothesis

- Initial hypothesis: malicious / operational retry / misconfiguration / unknown
- Confidence level: high / medium / low
- Evidence supporting hypothesis:
- Evidence against hypothesis:
- Analyst decision: escalate / monitor / close as benign / request more context
- Additional context needed:

## Blind Triage Summary

- Which flow appears more suspicious and why?
- Which flow appears more operational and why?
- What signal could be misleading?
- What would I check next in a real SOC/OT environment?
- What is my biggest uncertainty?

## Integrity Note

I completed this worksheet before reviewing ground truth logs or script labels.

- Completed by:
- Completion timestamp:
