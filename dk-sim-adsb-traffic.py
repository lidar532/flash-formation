#!/usr/bin/python2
# Python 2.7
# W. Wright lidar532(AT)gmail.com
# Example Dronekit python to generate a simulated ADSB message.

import dronekit as dk
from time import sleep

##v_UDP = 'udp:192.168.66.152:14573'              # Simulated Quad.
v_UDP = 'udp:192.168.66.152:14563'              # Simulated Quad.
print('Attempting to connecting to:%s', v_UDP)
v  = dk.connect( v_UDP, wait_ready = True )
print( 'Connected' )

print( v.location.global_frame )

ads_aflags  = 1+2+4+8+0x10+0x20+0x80+0x100+0x8000           # See flags at https://uavionix.com/downloads/integration/uAvionix%20Ping%20Integration%20Guide.pdf
ads_icao    = 0xA01234
ads_type    = 14           # 14 for UAS
ads_lat     = 27.6427501   # deg
ads_lon     = -82.5584961  # deg
ads_alt     = 30000.0	   #  mm
ads_heading = 27000.0      # 0-36000
ads_speed   = 1000.0       # cm/sec
ads_roc     = 50000.0      # cm/sec
squawk      = 0o1200       # Octal squack code.  1200 for VFR
ads_callsign= 'Leader'


ads2_icao    = 0xA01235
ads2_lat     = 27.6429000   # deg
ads2_callsign= 'Leader'

# Generate an ADSB packet
adsb_msg = v.message_factory.adsb_vehicle_encode(
   ads_icao,         # ui32 ICAO code. anything works here
   ads_lat*1e7,      # Latitude in deg * 1e7
   ads_lon*1e7,      # Longitude in deg * 1e7
   0, 		     # 0 = baro, 1=GNSS
   ads_alt,	     # Altitude in mm, 30m = 30000
   ads_heading,      # degrees * 100 0-36000
   ads_speed,        # speed in cm/sec
   0,	     	     # Vertical speed cm/sec
   ads_callsign,     # callsign, 9 char null term
   ads_type,         # Type.  14=UAS 
   1,  		     # time since last comm (secs)
   ads_aflags,       # status flags
   01200             # Squak code.  Octal 1200 for VFR
  )
print(adsb_msg)


adsb2_msg = v.message_factory.adsb_vehicle_encode(
   ads2_icao,         # ui32 ICAO code. anything works here
   ads2_lat*1e7,      # Latitude in deg * 1e7
   ads_lon*1e7,      # Longitude in deg * 1e7
   0, 		     # 0 = baro, 1=GNSS
   ads_alt,	     # Altitude in mm, 30m = 30000
   ads_heading,      # degrees * 100 0-36000
   ads_speed,        # speed in cm/sec
   0,	     	     # Vertical speed cm/sec
   ads_callsign,     # callsign, 9 char null term
   ads_type,         # Type.  14=UAS 
   1,  		     # time since last comm (secs)
   ads_aflags,       # status flags
   01200             # Squak code.  Octal 1200 for VFR
  )
print(adsb2_msg)


# Transmit.   Intended to be received by ground stations
v.send_mavlink( adsb_msg )
sleep(1)
v.send_mavlink( adsb2_msg )


