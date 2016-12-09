# Longtail-Dev
New Longtail Environment

### Proposed System
![Longtail-ENV](/doc/Longtail\ Diagram\ NEW.png)

### Steps
1. PHASE I: SSH Honeypot Functionality
	- [ ] Get CentOS SSH Honeypot working with Eric's Directions
		- [ ] Deploy
		- [ ] Make Install Script
		- [ ] Document
		- [ ] Create OVA
	- [ ] Test on other Distros
		- [X] Ubuntu
		- [ ] RHEL
		- [ ] AWS
2. PHASE II: Get Graylog Up and Running
	- [X] Test with Single-Node environment
		- [X] Configure Graylog
		- [X] Point Honeypots
		- [X] Point Blackridge
		- [ ] Point Cisco/Juniper Boxes
	- [ ] Send Logs to Second Server for Storage
	- [ ] Deploy Multi-Node Environment
		- [ ] MongoDB ReplicaSet
		- [ ] Elastic Search Cluster
		- [ ] Configure Graylog
		- [ ] Loadbalancer
		- [ ] Document
	- [ ] Point Devices
		- [ ] Honeypots
		- [ ] Blackridge 
		- [ ] Juniper/Cisco
4. PHASE III: Testing
	- [ ] Honeypot Attacks
		- [ ] Automate/Schedule Attacks
		- [ ] Create Metrics
	- [ ] Graylog Testing
		- [ ] Test Threshold
		- [ ] Adding Cluster Nodes
	- [ ] Document
3. PHASE IV: Commercialize/Package for Marist
	- [ ] Create OVA's
	- [ ] Look into Orchestration of entire environment
	- [ ] Present to IT 
	
# License
Hive is a Honeypot-Network Management Tool.

Copyright (C) 2016 Marist College IT Department

Some code used by Hive is directly based off of Eric Wedaa's work at Marist College.
Files and code will be especially accredited to him and his contributors in each 
source file. Some functionality of the Hive is directly based off of Eric Wedaa's
Longtail project. 

A copy of the Apache License is available in this repository in the [LICENSE.txt] file.



