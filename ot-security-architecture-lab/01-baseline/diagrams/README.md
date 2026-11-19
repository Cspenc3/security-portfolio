# Phase 1 architecture diagrams

**Purpose:** Introduce the simulated GRFICSv3 industrial environment at a glance, then refine the topology as Phase 2 networking tests establish exact interfaces, routes and allowed communication.

**File to upload:** `grficsv3-phase-01-high-level-topology.png`

The image is a **conceptual representation**, informed by observations from the Docker and PLC/HMI lab. Some arrows and placements are design abstractions, not verified packet paths.

### Confirmed so far
- HMI interfaces previously observed on Docker admin network (`172.18.0.4`) and DMZ (`192.168.90.107`).
- EWS interfaces previously observed on Docker admin network (`172.18.0.3`) and ICS network (`192.168.95.5`).
- HMI route observed toward ICS via `192.168.90.200`.
- Seven containers and their host port mappings inventoried.
- Chemical plant simulator and SCADA-LTS available; process readings changed between screenshots.

### Still to verify
- Full network membership and exact communications of each container (including security tooling).
- Modbus device connection state and actual PLC/process data paths.
- Network policies, segmentation effectiveness and whether every connection shown is required/allowed.

**Phase 2:** Build a verified logical/data-flow topology from inspection and captures, then create a separate proposed Cisco Packet Tracer design to demonstrate network engineering without misrepresenting Docker topology.
