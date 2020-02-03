#!/bin/bash
#
# W. Wright lidar532(at)gmail.com
#
#  This script:
#	* Configures IPs of various devices to be able to connect as GC units
#	* Kills any running SITL simulators, and mavlink-routed
#	* Runs Three SITL UAS simulators on different ports
#	* Runs Three mavlink-routed routers to allow UDP connectiion to each by listed devices
#	* Leaves 5760 free for Mission Planner SITL sim to run.  It is the only one that will do
#	  missions so far.
#


# Main desktop 
WWDT="192.168.66.126"

# Laptop
WWLT="192.168.66.126"

# Ipad
IPAD="192.168.66.139"

# T-580 Android tablet (large)
T280="192.168.66.119"

# T-280 Android tablet (small)
T580="192.168.66.141"

# Local Linux Vm where the sims are running
LVM="192.168.66.152"

# Iphone-X
IPHONE="192.168.66.103"


# Kill any existing sitls 
killall -9 /home/wright/.dronekit/sitl/solo-2.0.20/apm
killall -9 mavlink-routerd
sleep 1
killall -9 /home/wright/.dronekit/sitl/solo-2.0.20/apm
sleep 1

# Start the sims. Leaves first port block at 5760 free
# for use by the sim version that does missions.
dronekit-sitl solo-2.0.20 -I1 --home=27.6426,-82.5577,16.13,353 --model=quad -w  > /dev/null 2>/dev/null  &	# 5770
dronekit-sitl solo-2.0.20 -I2 --home=27.6427,-82.5578,16.13,353 --model=quad -w  > /dev/null 2>/dev/null  &	# 5780
dronekit-sitl solo-2.0.20 -I3 --home=27.6428,-82.5579,16.13,353 --model=quad -w  > /dev/null 2>/dev/null  &	# 5790
echo " 3 SOLO SITL running in 5760, 70, 80, & 90 ...."

echo " Connecting UDP ports to SITLs with mavlink-routed"

/home/wright/mavlink-router/mavlink-routerd -p $WWDT:5760 \
	-e $WWDT:14560 \
	-e $WWDT:14561 \
	-e $IPAD:14562 \
	-e  $LVM:14563  \
	-e  $LVM:14564 	\
	-e $T280:14565    \
	-e $T580:14566    \
	-e $IPHONE:14567    &

/home/wright/mavlink-router/mavlink-routerd -p $LVM:5770 \
	-e $WWDT:14570 \
	-e $WWDT:14571 \
	-e $IPAD:14572 \
	-e  $LVM:14573  \
	-e  $LVM:14574 	\
	-e $T280:14575    \
	-e $T580:14576    \
	-e $IPHONE:14577    &

/home/wright/mavlink-router/mavlink-routerd -p $LVM:5780 \
	-e $WWDT:14580 \
	-e $WWDT:14581 \
	-e $IPAD:14582 \
	-e  $LVM:14583  \
	-e  $LVM:14584    \
	-e $T280:14585    \
	-e $T580:14586    \
	-e $IPHONE:14587    &


/home/wright/mavlink-router/mavlink-routerd -p $LVM:5790 \
	-e $WWDT:14590 \
	-e $WWDT:14591 \
	-e $IPAD:14592 \
	-e  $LVM:14593  \
	-e  $LVM:14594    \
	-e $T280:14595    \
	-e $T580:14596    \
	-e $IPHONE:14597    &


