# OT/IT Boundary Triage Lab

## Purpose

This lab is a simulated SOC/OT network triage exercise. It compares two traffic patterns that can look similar at the network layer:

1. A C2-style timed outbound beacon simulation.
2. An OT/IIoT-style retry pattern to a downed MQTT broker.

The goal is not to claim a real incident, breach, or attack occurred. The goal is to practice identifying ambiguity, documenting evidence, and using OT/SRE context to avoid jumping to the wrong conclusion.

## Why This Matters

SOC analysts often look for repeated outbound traffic as a possible sign of malware beaconing. In OT and industrial environments, repeated traffic can also be normal or semi-normal behavior caused by polling, retries, failed dependencies, time sync issues, broker outages, or vendor system behavior.

This lab demonstrates the difference between seeing a suspicious pattern and proving malicious intent.

## Lab Architecture

```text
Ubuntu VM
├── beacon_sim.sh       -> repeated TCP connection attempts to 203.0.113.10:443
├── ot_retry_sim.sh     -> repeated TCP connection attempts to 192.168.56.250:1883
├── Wireshark capture   -> records both patterns during the same capture window
└── Analyst worksheet   -> completed before reviewing ground truth logs
```

## Tools Used

- Ubuntu VM
- Bash
- Wireshark
- Markdown documentation

## Safety Scope

This lab is safe and non-malicious:

- No malware
- No exploitation
- No scanning
- No payload delivery
- No real C2 infrastructure
- Uses documentation/test IP space and private lab IP addressing

## Files

| File | Purpose |
|---|---|
| `scripts/beacon_sim.sh` | Simulates C2-like timed outbound connection attempts |
| `scripts/ot_retry_sim.sh` | Simulates OT retry behavior to a downed MQTT broker |
| `blind-triage-worksheet.md` | Analyst worksheet completed before reviewing ground truth |
| `ground-truth.md` | Reveals which traffic came from which script |
| `incident-report-template.md` | Final report structure for analysis and lessons learned |
| `logs/` | Runtime script logs created during lab execution |
| `screenshots/` | Wireshark screenshots captured during analysis |
| `pcaps/` | Packet capture files or small extracts |

## How to Run

From the repository root:

```bash
cd ot-it-boundary-triage-lab/scripts
chmod +x beacon_sim.sh ot_retry_sim.sh
```

Start a Wireshark capture on the active VM interface, then run both scripts concurrently:

```bash
./beacon_sim.sh &
./ot_retry_sim.sh &
```

Let both scripts run for about 15–20 minutes while Wireshark captures traffic.

## Suggested Wireshark Filters

```text
tcp.port == 443 or tcp.port == 1883
ip.addr == 203.0.113.10
ip.addr == 192.168.56.250
tcp.port == 1883
tcp.port == 443
```

## Blind Triage Process

1. Capture the traffic.
2. Review the PCAP in Wireshark.
3. Complete `blind-triage-worksheet.md` before opening script logs or `ground-truth.md`.
4. Record uncertainty honestly.
5. Identify what additional operational context would be needed in a real environment.
6. Review `ground-truth.md`.
7. Complete the accuracy assessment in the final report.

## Required Evidence Before Sharing

- Completed blind triage worksheet
- Script logs from both simulations
- PCAP or small PCAP extract
- 4–6 annotated Wireshark screenshots
- Ground truth comparison
- Final report with OT/SRE disambiguation section

## Skills Demonstrated

- Wireshark traffic analysis
- SOC-style triage discipline
- OT/SRE operational reasoning
- False positive awareness
- Network evidence documentation
- Security vs. reliability disambiguation
- Clear technical reporting

## Key Takeaway

A repeated network interval is not automatically malicious. In OT environments, the analyst must combine packet evidence with operational context, asset knowledge, segmentation boundaries, service dependencies, and baseline behavior before deciding whether to escalate.
