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
 1. MAVLink-routed
 1. Mission Planner
 2. QGroundControl

## ToDo
 * Develop formation code
 * Migrate to RPI3
 * Fan out to run on 3 different RPI, one per UAS
 * Add ADS-B receiver(s) to the RPI
 * Route ADS-B data to one or all of the UAS GroundControllers
 * Get SITL running on RPI
 * Get MAVLink-routerd on RPI
 * Web interface with GUI to adjust formation software
 * Migrate to UAS aircraft
