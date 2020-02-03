# Flash-Formation

Software to simulate 3 Solo-like quad copters using the Mavlink command, control, and telemetry 
data streams.  It also implements simulated ADS-B Mavlink packets allowing display of all three
UAS on all of the connected ground controllers.  Software will also be added to generate wayoints
for left and right "Wingman" UAS at designated X/Y and Z offsets from the flight "Leader". 

## Purpose
This code:
 1. Configures 3 Solo-like SITL simulators
 1. Configures TCP and UDP Routing between the three UAS and several different Ground Controllers
 1. Generates simulated ADS-B packets for each UAS
 1. Transmits the simulated ADS-B data to each of the other UAS
 1. Computes waypoints in X/Y/Z for each of the wingman UAS

## Requirements
 1. dronekit for Python
 1. Mission Planner
 2. QGroundControl

## ToDo
 * ddddd
 * eeeee
