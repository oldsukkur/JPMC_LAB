# CAMPUS_GLOBAL

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| LAB | l3leaf | C000140-CCS-720XP | 192.168.0.101/24 | 720XP-48 | Provisioned | - |
| LAB | l3leaf | C000140-CCS-758 | 192.168.0.108/24 | 758 | Provisioned | - |
| LAB | spine | C000140-DCS-7304X3 | 192.168.0.200/24 | 7304-x3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | C000140-CCS-720XP | Ethernet53/1 | spine | C000140-DCS-7304X3 | Ethernet3/1/1 |
| l3leaf | C000140-CCS-758 | Ethernet1/1/1 | spine | C000140-DCS-7304X3 | Ethernet3/2/1 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 192.168.3.0/24 | 256 | 4 | 1.57 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| C000140-CCS-720XP | Ethernet53/1 | 192.168.3.1/31 | C000140-DCS-7304X3 | Ethernet3/1/1 | 192.168.3.0/31 |
| C000140-CCS-758 | Ethernet1/1/1 | 192.168.3.3/31 | C000140-DCS-7304X3 | Ethernet3/2/1 | 192.168.3.2/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.1.0/24 | 256 | 1 | 0.4 % |
| 192.168.100.0/24 | 256 | 2 | 0.79 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| LAB | C000140-CCS-720XP | 192.168.100.1/32 |
| LAB | C000140-CCS-758 | 192.168.100.2/32 |
| LAB | C000140-DCS-7304X3 | 192.168.1.251/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 192.168.200.0/24 | 256 | 2 | 0.79 % |
| 192.168.203.0/24 | 256 | 1 | 0.4 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| LAB | C000140-CCS-720XP | 192.168.200.1/32 |
| LAB | C000140-CCS-758 | 192.168.200.2/32 |
| LAB | C000140-DCS-7304X3 | 192.168.203.251/32 |
