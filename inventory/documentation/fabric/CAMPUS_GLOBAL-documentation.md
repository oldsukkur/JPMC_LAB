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
| LAB | spine | C000140-001R601A | 192.168.0.251/24 | 7304-x3 | Provisioned | - |
| LAB | spine | C000140-001R602A | 192.168.0.252/24 | 7304-x3 | Provisioned | - |
| LAB | l3leaf | C000140-001S001A | 192.168.0.101/24 | 720XP-48 | Provisioned | - |
| LAB | l3leaf | C000140-001S002A | 192.168.0.102/24 | 720XP-48 | Provisioned | - |
| LAB | l3leaf | C000140-001S003A | 192.168.0.103/24 | 758 | Provisioned | - |
| LAB | l3leaf | C000140-001S004A | 192.168.0.104/24 | 758 | Provisioned | - |
| LAB | service_leaf | C000140-001S560A | 192.168.0.160/24 | 7050TX3-48 | Provisioned | - |
| LAB | service_leaf | C000140-001S561A | 192.168.0.161/24 | 7050TX3-48 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| spine | C000140-001R601A | Ethernet3/1/1 | l3leaf | C000140-001S001A | Ethernet53/1 |
| spine | C000140-001R601A | Ethernet3/2/1 | l3leaf | C000140-001S002A | Ethernet53/1 |
| spine | C000140-001R601A | Ethernet3/3/1 | l3leaf | C000140-001S003A | Ethernet1/1/1 |
| spine | C000140-001R601A | Ethernet3/4/1 | l3leaf | C000140-001S004A | Ethernet1/1/1 |
| spine | C000140-001R601A | Ethernet3/5/1 | service_leaf | C000140-001S560A | Ethernet53/1 |
| spine | C000140-001R601A | Ethernet3/6/1 | service_leaf | C000140-001S561A | Ethernet53/1 |
| spine | C000140-001R602A | Ethernet3/1/1 | l3leaf | C000140-001S001A | Ethernet54/1 |
| spine | C000140-001R602A | Ethernet3/2/1 | l3leaf | C000140-001S002A | Ethernet54/1 |
| spine | C000140-001R602A | Ethernet3/3/1 | l3leaf | C000140-001S003A | Ethernet2/1/1 |
| spine | C000140-001R602A | Ethernet3/4/1 | l3leaf | C000140-001S004A | Ethernet2/1/1 |
| spine | C000140-001R602A | Ethernet3/5/1 | service_leaf | C000140-001S560A | Ethernet54/1 |
| spine | C000140-001R602A | Ethernet3/6/1 | service_leaf | C000140-001S561A | Ethernet54/1 |
| service_leaf | C000140-001S560A | Ethernet51/1 | mlag_peer | C000140-001S561A | Ethernet51/1 |
| service_leaf | C000140-001S560A | Ethernet52/1 | mlag_peer | C000140-001S561A | Ethernet52/1 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 192.168.3.0/24 | 256 | 24 | 9.38 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| C000140-001R601A | Ethernet3/1/1 | 192.168.3.0/31 | C000140-001S001A | Ethernet53/1 | 192.168.3.1/31 |
| C000140-001R601A | Ethernet3/2/1 | 192.168.3.4/31 | C000140-001S002A | Ethernet53/1 | 192.168.3.5/31 |
| C000140-001R601A | Ethernet3/3/1 | 192.168.3.8/31 | C000140-001S003A | Ethernet1/1/1 | 192.168.3.9/31 |
| C000140-001R601A | Ethernet3/4/1 | 192.168.3.12/31 | C000140-001S004A | Ethernet1/1/1 | 192.168.3.13/31 |
| C000140-001R601A | Ethernet3/5/1 | 192.168.3.16/31 | C000140-001S560A | Ethernet53/1 | 192.168.3.17/31 |
| C000140-001R601A | Ethernet3/6/1 | 192.168.3.20/31 | C000140-001S561A | Ethernet53/1 | 192.168.3.21/31 |
| C000140-001R602A | Ethernet3/1/1 | 192.168.3.2/31 | C000140-001S001A | Ethernet54/1 | 192.168.3.3/31 |
| C000140-001R602A | Ethernet3/2/1 | 192.168.3.6/31 | C000140-001S002A | Ethernet54/1 | 192.168.3.7/31 |
| C000140-001R602A | Ethernet3/3/1 | 192.168.3.10/31 | C000140-001S003A | Ethernet2/1/1 | 192.168.3.11/31 |
| C000140-001R602A | Ethernet3/4/1 | 192.168.3.14/31 | C000140-001S004A | Ethernet2/1/1 | 192.168.3.15/31 |
| C000140-001R602A | Ethernet3/5/1 | 192.168.3.18/31 | C000140-001S560A | Ethernet54/1 | 192.168.3.19/31 |
| C000140-001R602A | Ethernet3/6/1 | 192.168.3.22/31 | C000140-001S561A | Ethernet54/1 | 192.168.3.23/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.1.0/24 | 256 | 2 | 0.79 % |
| 192.168.100.0/24 | 256 | 6 | 2.35 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| LAB | C000140-001R601A | 192.168.1.251/32 |
| LAB | C000140-001R602A | 192.168.1.252/32 |
| LAB | C000140-001S001A | 192.168.100.1/32 |
| LAB | C000140-001S002A | 192.168.100.2/32 |
| LAB | C000140-001S003A | 192.168.100.3/32 |
| LAB | C000140-001S004A | 192.168.100.4/32 |
| LAB | C000140-001S560A | 192.168.100.5/32 |
| LAB | C000140-001S561A | 192.168.100.6/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 192.168.200.0/24 | 256 | 4 | 1.57 % |
| 192.168.203.0/24 | 256 | 2 | 0.79 % |
| 192.168.210.0/24 | 256 | 2 | 0.79 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| LAB | C000140-001R601A | 192.168.203.251/32 |
| LAB | C000140-001R602A | 192.168.203.252/32 |
| LAB | C000140-001S001A | 192.168.200.1/32 |
| LAB | C000140-001S002A | 192.168.200.2/32 |
| LAB | C000140-001S003A | 192.168.200.3/32 |
| LAB | C000140-001S004A | 192.168.200.4/32 |
| LAB | C000140-001S560A | 192.168.210.5/32 |
| LAB | C000140-001S561A | 192.168.210.5/32 |
