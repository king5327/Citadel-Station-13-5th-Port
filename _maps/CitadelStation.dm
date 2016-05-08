/*
The /tg/ codebase currently requires you to have 7 z-levels of the same size dimensions.
z-level order is important, the order you put them in inside this file will determine what z level number they are assigned ingame.
Names of z-level do not matter, but order does greatly, for instances such as checking alive status of revheads on z1

current as of 2/11/2016
z1 = station
z2 = centcomm
z3 = derelict telecomms satellite
z4 = derelict station
z5 = mining
z6 = empty space
z7 = empty space
*/

#if !defined(MAP_FILE)

        #include "map_files\CitadelStation\CitadelStation.01.dmm"
        #include "map_files\CitadelStation\CitadelStation.02.dmm"
		#include "map_files\CitadelStation\CitadelStation.03.dmm"
		#include "map_files\CitadelStation\CitadelStation.04.dmm"
		#include "map_files\CitadelStation\CitadelStation.05.dmm"
		#include "map_files\CitadelStation\CitadelStation.06.dmm"
		#include "map_files\CitadelStation\CitadelStation.07.dmm"

        #define MAP_FILE "CitadelStation.01.dmm"
        #define MAP_NAME "Citadel Station"

        #define MAP_TRANSITION_CONFIG	list(MAIN_STATION = CROSSLINKED, CENTCOMM = SELFLOOPING, ABANDONED_SATELLITE = CROSSLINKED, DERELICT = CROSSLINKED, MINING = CROSSLINKED, EMPTY_AREA_1 = CROSSLINKED, EMPTY_AREA_2 = CROSSLINKED)

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring Citadel Station.

#endif