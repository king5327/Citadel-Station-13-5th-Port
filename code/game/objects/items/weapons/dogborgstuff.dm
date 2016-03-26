// Special tools and items for "Borgi" and "K-9 Unit"

/obj/item/weapon/dogborg/jaws/big
	name = "combat jaws"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "jaws"
	desc = "The jaws of the law."
	flags = CONDUCT
	force = 15
	throwforce = 8
	hitsound = 'sound/weapons/bite.ogg'
	attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")
	w_class = 3
	sharpness = IS_SHARP

/obj/item/weapon/dogborg/jaws/small
	name = "puppy jaws"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "smalljaws"
	desc = "The jaws of a small dog."
	flags = CONDUCT
	force = 5
	throwforce = 2
	hitsound = 'sound/weapons/bite.ogg'
	attack_verb = list("nibbled", "bit", "gnawed", "chomped", "nommed")
	w_class = 3
	sharpness = IS_SHARP
	var/emagged = 0

/obj/item/weapon/dogborg/jaws/small/attack_self(mob/user)
	var/mob/living/silicon/robot.R = user
	if(R.emagged)
		emagged = !emagged
		if(emagged)
			name = "combat jaws"
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "jaws"
			desc = "The jaws of the law."
			flags = CONDUCT
			force = 10
			throwforce = 8
			hitsound = 'sound/weapons/bite.ogg'
			attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")
			w_class = 3
			sharpness = IS_SHARP
		else
			name = "puppy jaws"
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "smalljaws"
			desc = "The jaws of a small dog."
			flags = CONDUCT
			force = 5
			throwforce = 2
			hitsound = 'sound/weapons/bite.ogg'
			attack_verb = list("nibbled", "bit", "gnawed", "chomped", "nommed")
			w_class = 3
			sharpness = IS_SHARP
		update_icon()

/obj/item/weapon/restraints/handcuffs/cable/zipties/cyborg/dog/attack(mob/living/carbon/C, mob/user)
	if(isrobot(user))
		if(!C.handcuffed)
			playsound(loc, 'sound/weapons/cablecuff.ogg', 30, 1, -2)
			C.visible_message("<span class='danger'>[user] is trying to put zipties on [C]!</span>", \
								"<span class='userdanger'>[user] is trying to put zipties on [C]!</span>")
			if(do_mob(user, C, 30))
				if(!C.handcuffed)
					C.handcuffed = new /obj/item/weapon/restraints/handcuffs/cable/zipties/used(C)
					C.update_inv_handcuffed(0)
					user << "<span class='notice'>You handcuff [C].</span>"
					playsound(loc, pick('sound/voice/bgod.ogg', 'sound/voice/biamthelaw.ogg', 'sound/voice/bsecureday.ogg', 'sound/voice/bradio.ogg', 'sound/voice/binsult.ogg', 'sound/voice/bcreep.ogg'), 50, 0)
					add_logs(user, C, "handcuffed")
			else
				user << "<span class='warning'>You fail to handcuff [C]!</span>"

/obj/item/device/analyzer/nose
	name = "boop module"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "nose"
	desc = "The BOOP module"
	flags = CONDUCT
	force = 0
	throwforce = 0
	attack_verb = list("nuzzled", "nosed", "booped")
	w_class = 1

/obj/item/device/analyzer/nose/attack_self(mob/user)
	user.visible_message("[user] sniffs around the air.", "<span class='warning'>You sniff the air for gas traces.</span>")

	var/turf/location = user.loc
	if (!( istype(location, /turf) ))
		return

	var/datum/gas_mixture/environment = location.return_air()

	var/pressure = environment.return_pressure()
	var/total_moles = environment.total_moles()

	user.show_message("<span class='info'><B>Results:</B></span>", 1)
	if(abs(pressure - ONE_ATMOSPHERE) < 10)
		user.show_message("<span class='info'>Pressure: [round(pressure,0.1)] kPa</span>", 1)
	else
		user.show_message("<span class='alert'>Pressure: [round(pressure,0.1)] kPa</span>", 1)
	if(total_moles)
		var/o2_concentration = environment.oxygen/total_moles
		var/n2_concentration = environment.nitrogen/total_moles
		var/co2_concentration = environment.carbon_dioxide/total_moles
		var/plasma_concentration = environment.toxins/total_moles

		var/unknown_concentration =  1-(o2_concentration+n2_concentration+co2_concentration+plasma_concentration)
		if(abs(n2_concentration - N2STANDARD) < 20)
			user.show_message("<span class='info'>Nitrogen: [round(n2_concentration*100)] %</span>", 1)
		else
			user.show_message("<span class='alert'>Nitrogen: [round(n2_concentration*100)] %</span>", 1)

		if(abs(o2_concentration - O2STANDARD) < 2)
			user.show_message("<span class='info'>Oxygen: [round(o2_concentration*100)] %</span>", 1)
		else
			user.show_message("<span class='alert'>Oxygen: [round(o2_concentration*100)] %</span>", 1)

		if(co2_concentration > 0.01)
			user.show_message("<span class='alert'>CO2: [round(co2_concentration*100)] %</span>", 1)
		else
			user.show_message("<span class='info'>CO2: [round(co2_concentration*100)] %</span>", 1)

		if(plasma_concentration > 0.01)
			user.show_message("<span class='info'>Plasma: [round(plasma_concentration*100)] %</span>", 1)

		if(unknown_concentration > 0.01)
			user.show_message("<span class='alert'>Unknown: [round(unknown_concentration*100)] %</span>", 1)

		user.show_message("<span class='info'>Temperature: [round(environment.temperature-T0C)] &deg;C</span>", 1)
	return


/obj/item/weapon/storage/bag/borgdelivery
	name = "fetching storage"
	desc = "Fetch the thing!"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "dbag"
	//Can hold one big item at a time. Drops contents on unequip.(see inventory.dm)
	w_class = 5
	max_w_class = 4
	max_combined_w_class = 4
	storage_slots = 1
	collection_mode = 0
	can_hold = list() // any
	cant_hold = list(/obj/item/weapon/disk/nuclear)

/obj/item/weapon/soap/tongue
	name = "synthetic tongue"
	desc = "Useful for slurping mess off the floor before affectionally licking the crew members in the face."
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "synthtongue"
	hitsound = 'sound/effects/attackblob.ogg'
	cleanspeed = 40
	var/emagged = 0

/obj/item/trash/rkibble
	name = "robo kibble"
	desc = "A novelty bowl of assorted mech fabricator byproducts. Mockingly feed this to the sec-dog to help it recharge."
	icon = 'icons/mob/dogborg.dmi'
	icon_state= "kibble"

/obj/item/weapon/soap/tongue/attack_self(mob/user)
	var/mob/living/silicon/robot.R = user
	if(R.emagged)
		emagged = !emagged
		if(emagged)
			name = "eRR.syn**DIE tongue"
			desc = "Your tongue has been upgraded successfully. Congratulations."
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "syndietongue"
			cleanspeed = 10 //tator soap stat
		else
			name = "synthetic tongue"
			desc = "Useful for slurping mess off the floor before affectionally licking the crew members in the face."
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "synthtongue"
			cleanspeed = 40
		update_icon()

/obj/item/weapon/soap/tongue/afterattack(atom/target, mob/user, proximity)
	if(!proximity || !check_allowed_items(target))
		return
	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	if(user.client && (target in user.client.screen))
		user << "<span class='warning'>You need to take that [target.name] off before cleaning it!</span>"
	else if(istype(target,/obj/effect/decal/cleanable))
		user.visible_message("[user] begins to lick off \the [target.name].", "<span class='warning'>You begin to lick off \the [target.name]...</span>")
		if(do_after(user, src.cleanspeed, target = target))
			user << "<span class='notice'>You finish licking off \the [target.name].</span>"
			qdel(target)
			var/mob/living/silicon/robot.R = user
			R.cell.charge = R.cell.charge + 50
	else if(istype(target,/obj/item)) //hoo boy. danger zone man
		if(istype(target,/obj/item/trash))
			user.visible_message("[user] nibbles away at \the [target.name].", "<span class='warning'>You begin to nibble away at \the [target.name]...</span>")
			if(do_after(user, src.cleanspeed, target = target))
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				qdel(target)
				var/mob/living/silicon/robot.R = user
				R.cell.charge = R.cell.charge + 250
			return
		if(istype(target,/obj/item/weapon/stock_parts/cell))
			user.visible_message("[user] begins cramming \the [target.name] down its throat.", "<span class='warning'>You begin cramming \the [target.name] down your throat...</span>")
			if(do_after(user, 50, target = target))
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				var/mob/living/silicon/robot.R = user
				var/obj/item/weapon/stock_parts/cell.C = target
				R.cell.charge = R.cell.charge + (C.charge / 3) //Instant full cell upgrades op
				qdel(target)
			return
		var/obj/item/I = target
		if(!I.anchored && src.emagged)
			user.visible_message("[user] begins chewing up \the [target.name]. Looks like it's trying to loophole around its diet restriction!", "<span class='warning'>You begin chewing up \the [target.name]...</span>")
			if(do_after(user, 50, target = I))
				visible_message("<span class='warning'>[user] has straight up devoured \the [target.name]!</span>")
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				qdel(I)
				var/mob/living/silicon/robot.R = user
				R.cell.charge = R.cell.charge + 500
			return
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, src.cleanspeed, target = target))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			var/obj/effect/decal/cleanable/C = locate() in target
			qdel(C)
			target.clean_blood()
	else if(ishuman(target))
		if(src.emagged)
			var/mob/living/silicon/robot.R = user
			var/mob/living/L = target
			if(R.cell.charge <= 500)
				return
			L.Stun(5)
			L.Weaken(5)
			L.apply_effect(STUTTER, 5)
			L.visible_message("<span class='danger'>[user] has shocked [L] with its tongue!</span>", \
								"<span class='userdanger'>[user] has shocked you with its tongue! You can feel the betrayal.</span>")
			playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
			R.cell.charge = R.cell.charge - 500
		else
			user.visible_message("<span class='warning'>\the [user] affectionally licks \the [target]'s face!</span>", "<span class='notice'>You affectionally lick \the [target]'s face!</span>")
			playsound(src.loc, 'sound/effects/attackblob.ogg', 50, 1)
			return
	else if(istype(target, /obj/structure/window))
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, src.cleanspeed, target = target))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			target.color = initial(target.color)
			target.SetOpacity(initial(target.opacity))
	else
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, src.cleanspeed, target = target))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			var/obj/effect/decal/cleanable/C = locate() in target
			qdel(C)
			target.clean_blood()
	return

// Pounce stuff for K-9

/obj/item/weapon/dogborg/pounce
	name = "pounce"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "pounce"
	desc = "Leap at your target to momentarily stun them."
	force = 0
	throwforce = 0

/mob/living/silicon/robot
	var/leaping = 0
	var/pounce_cooldown = 0
	var/pounce_cooldown_time = 25
	var/leap_at
	var/disabler
	var/laser

#define MAX_K9_LEAP_DIST 7

/obj/item/weapon/dogborg/pounce/afterattack(atom/A, mob/user)
	var/mob/living/silicon/robot.R = user
	R.leap_at(A)

/mob/living/silicon/robot/proc/leap_at(atom/A)
	if(pounce_cooldown)
		src << "<span class='danger'>Your leg actuators are still recharging!</span>"
		return

	if(leaping) //Leap while you leap, so you can leap while you leap
		return

	if(!has_gravity(src) || !has_gravity(A))
		src << "<span class='danger'>It is unsafe to leap without gravity!</span>"
		//It's also extremely buggy visually, so it's balance+bugfix
		return

	if(cell.charge <= 250)
		return

	else
		leaping = 1
		pixel_y = 10
		throw_at(A,MAX_K9_LEAP_DIST,1, spin=0, diagonals_first = 1)
		leaping = 0
		pixel_y = initial(pixel_y)
		cell.charge = cell.charge - 250
		pounce_cooldown = !pounce_cooldown
		spawn(pounce_cooldown_time)
			pounce_cooldown = !pounce_cooldown

/mob/living/silicon/robot/throw_impact(atom/A, params)

	if(!leaping)
		return ..()

	if(A)
		if(istype(A, /mob/living))
			var/mob/living/L = A
			var/blocked = 0
			if(ishuman(A))
				var/mob/living/carbon/human/H = A
				if(H.check_shields(90, "the [name]", src, 1))
					blocked = 1
			if(!blocked)
				L.visible_message("<span class ='danger'>[src] pounces on [L]!</span>", "<span class ='userdanger'>[src] pounces on you!</span>")
				L.Weaken(3)//enough to cuff em before they run off again
				sleep(2)//Runtime prevention (infinite bump() calls on hulks)
				step_towards(src,L)

		else if(A.density && !A.CanPass(src))
			visible_message("<span class ='danger'>[src] smashes into [A]!</span>")
			weakened = 2

		if(leaping)
			leaping = 0
			update_canmove()
