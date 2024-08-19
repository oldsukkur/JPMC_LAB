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
| MANILA | l3leaf | C000267-007S008P | 192.168.0.108/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-007S009P | 192.168.0.109/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-007S010P | 192.168.0.110/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-007S011P | 192.168.0.111/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-008S012P | 192.168.0.112/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-008S013P | 192.168.0.113/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-008S014P | 192.168.0.114/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-008S015P | 192.168.0.115/24 | 758 | Provisioned | - |
| MANILA | spine | C000267-009R601P | 192.168.0.200/24 | EOS | Provisioned | - |
| MANILA | l3leaf | C000267-009S016P | 192.168.0.116/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-009S017P | 192.168.0.117/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-009S018P | 192.168.0.118/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-009S019P | 192.168.0.119/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-009S560P | 192.168.0.160/24 | 7050TX3-48 | Provisioned | - |
| MANILA | l3leaf | C000267-009S561P | 192.168.0.161/24 | 7050TX3-48 | Provisioned | - |
| MANILA | l3leaf | C000267-010S020P | 192.168.0.120/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-010S021P | 192.168.0.121/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-010S022P | 192.168.0.122/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-010S023P | 192.168.0.123/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-011S024P | 192.168.0.124/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-011S025P | 192.168.0.125/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-011S026P | 192.168.0.126/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-011S027P | 192.168.0.127/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-012S028P | 192.168.0.128/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-012S029P | 192.168.0.129/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-012S030P | 192.168.0.130/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-012S031P | 192.168.0.131/24 | 758 | Provisioned | - |
| MANILA | spine | C000267-014R602P | 192.168.0.201/24 | EOS | Provisioned | - |
| MANILA | l3leaf | C000267-014S032P | 192.168.0.132/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-014S033P | 192.168.0.133/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-014S034P | 192.168.0.134/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-014S035P | 192.168.0.135/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-015S036P | 192.168.0.136/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-015S037P | 192.168.0.137/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-015S038P | 192.168.0.138/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-015S039P | 192.168.0.139/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-016S040P | 192.168.0.140/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-016S041P | 192.168.0.141/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-016S042P | 192.168.0.142/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-016S043P | 192.168.0.143/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-017S044P | 192.168.0.144/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-017S045P | 192.168.0.145/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-017S046P | 192.168.0.146/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-017S047P | 192.168.0.147/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-018S048P | 192.168.0.148/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-018S049P | 192.168.0.149/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-018S050P | 192.168.0.150/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-018S051P | 192.168.0.151/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-019S052P | 192.168.0.152/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-019S053P | 192.168.0.153/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-019S054P | 192.168.0.154/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-019S055P | 192.168.0.155/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-020S056P | 192.168.0.156/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-020S057P | 192.168.0.157/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-020S058P | 192.168.0.158/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-020S059P | 192.168.0.159/24 | 758 | Provisioned | - |
| MANILA | l3leaf | C000267-GRDS001P | 192.168.0.101/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-GRDS002P | 192.168.0.102/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-GRDS003P | 192.168.0.103/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-GRDS004P | 192.168.0.104/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-GRDS005P | 192.168.0.105/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-GRDS006P | 192.168.0.106/24 | 720XP-48 | Provisioned | - |
| MANILA | l3leaf | C000267-GRDS007P | 192.168.0.107/24 | 720XP-48 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| spine | C000267-009R601P | Ethernet3/1/1 | l3leaf | C000267-GRDS001P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet3/2/1 | l3leaf | C000267-GRDS002P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet3/3/1 | l3leaf | C000267-GRDS003P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet3/4/1 | l3leaf | C000267-GRDS004P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet3/5/1 | l3leaf | C000267-GRDS005P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet3/6/1 | l3leaf | C000267-GRDS006P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet3/7/1 | l3leaf | C000267-GRDS007P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet3/8/1 | l3leaf | C000267-007S008P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/9/1 | l3leaf | C000267-007S009P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/10/1 | l3leaf | C000267-007S010P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/11/1 | l3leaf | C000267-007S011P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/12/1 | l3leaf | C000267-008S012P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/13/1 | l3leaf | C000267-008S013P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/14/1 | l3leaf | C000267-008S014P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/15/1 | l3leaf | C000267-008S015P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/16/1 | l3leaf | C000267-009S016P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/17/1 | l3leaf | C000267-009S017P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/18/1 | l3leaf | C000267-009S018P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/19/1 | l3leaf | C000267-009S019P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/20/1 | l3leaf | C000267-010S020P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/21/1 | l3leaf | C000267-010S021P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/22/1 | l3leaf | C000267-010S022P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/23/1 | l3leaf | C000267-010S023P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/24/1 | l3leaf | C000267-011S024P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/25/1 | l3leaf | C000267-011S025P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/26/1 | l3leaf | C000267-011S026P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/27/1 | l3leaf | C000267-011S027P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/28/1 | l3leaf | C000267-012S028P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/29/1 | l3leaf | C000267-012S029P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/30/1 | l3leaf | C000267-012S030P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet3/31/1 | l3leaf | C000267-012S031P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/1/1 | l3leaf | C000267-014S032P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/2/1 | l3leaf | C000267-014S033P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/3/1 | l3leaf | C000267-014S034P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/4/1 | l3leaf | C000267-014S035P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/5/1 | l3leaf | C000267-015S036P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/6/1 | l3leaf | C000267-015S037P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/7/1 | l3leaf | C000267-015S038P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/8/1 | l3leaf | C000267-015S039P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/9/1 | l3leaf | C000267-016S040P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/10/1 | l3leaf | C000267-016S041P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/11/1 | l3leaf | C000267-016S042P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/12/1 | l3leaf | C000267-016S043P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/13/1 | l3leaf | C000267-017S044P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/14/1 | l3leaf | C000267-017S045P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/15/1 | l3leaf | C000267-017S046P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/16/1 | l3leaf | C000267-017S047P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/17/1 | l3leaf | C000267-018S048P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/18/1 | l3leaf | C000267-018S049P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/19/1 | l3leaf | C000267-018S050P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/20/1 | l3leaf | C000267-018S051P | Ethernet53/1 |
| spine | C000267-009R601P | Ethernet4/21/1 | l3leaf | C000267-019S052P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/22/1 | l3leaf | C000267-019S053P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/23/1 | l3leaf | C000267-019S054P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/24/1 | l3leaf | C000267-019S055P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/25/1 | l3leaf | C000267-020S056P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/26/1 | l3leaf | C000267-020S057P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/27/1 | l3leaf | C000267-020S058P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/28/1 | l3leaf | C000267-020S059P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/29/1 | l3leaf | C000267-009S560P | Ethernet1/1/1 |
| spine | C000267-009R601P | Ethernet4/30/1 | l3leaf | C000267-009S561P | Ethernet1/1/1 |
| spine | C000267-014R602P | Ethernet3/1/1 | l3leaf | C000267-GRDS001P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet3/2/1 | l3leaf | C000267-GRDS002P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet3/3/1 | l3leaf | C000267-GRDS003P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet3/4/1 | l3leaf | C000267-GRDS004P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet3/5/1 | l3leaf | C000267-GRDS005P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet3/6/1 | l3leaf | C000267-GRDS006P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet3/7/1 | l3leaf | C000267-GRDS007P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet3/8/1 | l3leaf | C000267-007S008P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/9/1 | l3leaf | C000267-007S009P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/10/1 | l3leaf | C000267-007S010P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/11/1 | l3leaf | C000267-007S011P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/12/1 | l3leaf | C000267-008S012P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/13/1 | l3leaf | C000267-008S013P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/14/1 | l3leaf | C000267-008S014P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/15/1 | l3leaf | C000267-008S015P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/16/1 | l3leaf | C000267-009S016P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/17/1 | l3leaf | C000267-009S017P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/18/1 | l3leaf | C000267-009S018P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/19/1 | l3leaf | C000267-009S019P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/20/1 | l3leaf | C000267-010S020P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/21/1 | l3leaf | C000267-010S021P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/22/1 | l3leaf | C000267-010S022P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/23/1 | l3leaf | C000267-010S023P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/24/1 | l3leaf | C000267-011S024P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/25/1 | l3leaf | C000267-011S025P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/26/1 | l3leaf | C000267-011S026P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/27/1 | l3leaf | C000267-011S027P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/28/1 | l3leaf | C000267-012S028P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/29/1 | l3leaf | C000267-012S029P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/30/1 | l3leaf | C000267-012S030P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet3/31/1 | l3leaf | C000267-012S031P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/1/1 | l3leaf | C000267-014S032P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/2/1 | l3leaf | C000267-014S033P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/3/1 | l3leaf | C000267-014S034P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/4/1 | l3leaf | C000267-014S035P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/5/1 | l3leaf | C000267-015S036P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/6/1 | l3leaf | C000267-015S037P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/7/1 | l3leaf | C000267-015S038P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/8/1 | l3leaf | C000267-015S039P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/9/1 | l3leaf | C000267-016S040P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/10/1 | l3leaf | C000267-016S041P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/11/1 | l3leaf | C000267-016S042P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/12/1 | l3leaf | C000267-016S043P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/13/1 | l3leaf | C000267-017S044P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/14/1 | l3leaf | C000267-017S045P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/15/1 | l3leaf | C000267-017S046P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/16/1 | l3leaf | C000267-017S047P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/17/1 | l3leaf | C000267-018S048P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/18/1 | l3leaf | C000267-018S049P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/19/1 | l3leaf | C000267-018S050P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/20/1 | l3leaf | C000267-018S051P | Ethernet54/1 |
| spine | C000267-014R602P | Ethernet4/21/1 | l3leaf | C000267-019S052P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/22/1 | l3leaf | C000267-019S053P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/23/1 | l3leaf | C000267-019S054P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/24/1 | l3leaf | C000267-019S055P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/25/1 | l3leaf | C000267-020S056P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/26/1 | l3leaf | C000267-020S057P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/27/1 | l3leaf | C000267-020S058P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/28/1 | l3leaf | C000267-020S059P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/29/1 | l3leaf | C000267-009S560P | Ethernet2/1/1 |
| spine | C000267-014R602P | Ethernet4/30/1 | l3leaf | C000267-009S561P | Ethernet2/1/1 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 192.168.3.0/24 | 256 | 122 | 47.66 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.1.0/24 | 256 | 2 | 0.79 % |
| 192.168.100.0/24 | 256 | 0 | 0.0 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| MANILA | C000267-009R601P | 192.168.1.251/32 |
| MANILA | C000267-014R602P | 192.168.1.252/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 192.168.200.0/24 | 256 | 0 | 0.0 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
