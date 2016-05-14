// Removed Jobs, setting config_check to 0 will stop them from being initialised.

/datum/job/chef/config_check()
	return 0

/datum/job/hydro/config_check()
	return 0

/datum/job/qm/config_check()
	return 0

/datum/job/mining/config_check()
	return 0

/datum/job/mime/config_check()
	return 0

/datum/job/librarian/config_check()
	return 0

/datum/job/lawyer/config_check()
	return 0

/datum/job/chaplain/config_check()
	return 0

/datum/job/chief_engineer/config_check()
	return 0

/datum/job/atmos/config_check()
	return 0

/datum/job/cmo/config_check()
	return 0

/datum/job/geneticist/config_check()
	return 0

/datum/job/virologist/config_check()
	return 0

/datum/job/rd/config_check()
	return 0

/datum/job/roboticist/config_check()
	return 0

/datum/job/hos/config_check()
	return 0

/datum/job/warden/config_check()
	return 0

/datum/job/cyborg/config_check()
	return 0

//DISABLED EVENTS

/datum/round_event_control/meteor_wave
	name = "Meteor Wave"
	typepath = null
	weight = 0
	max_occurrences = 0

/datum/round_event_control/meteor_wave/meaty
	name = "Meaty Ore Wave"
	typepath = null
	weight = 0
	max_occurrences = 0

/datum/round_event_control/operative
	name = "Lone Operative"
	typepath = null
	weight = 0
	max_occurrences = 0

/datum/round_event_control/anomaly/anomaly_flux
	name = "Anomaly: Hyper-Energetic Flux"
	typepath = null
	max_occurrences = 0
	weight = 0

/datum/round_event_control/anomaly/anomaly_vortex
	name = "Anomaly: Vortex"
	typepath = null
	max_occurrences = 0
	weight = 0