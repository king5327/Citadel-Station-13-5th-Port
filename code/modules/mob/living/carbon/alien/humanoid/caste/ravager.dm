/mob/living/carbon/alien/humanoid/ravager
	name = "alien ravager"
	caste = "rav"
	maxHealth = 350
	health = 350
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "alienrav"
	heat_protection = 2 //the only fire resistant caste
	ventcrawler = 0
	pixel_x = -16
	mob_size = MOB_SIZE_LARGE
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/xeno = 20, /obj/item/stack/sheet/animalhide/xeno = 3)
	pressure_resistance = 200
	layer = 6

/mob/living/carbon/alien/humanoid/ravager/New()

	real_name = name

	internal_organs += new /obj/item/organ/internal/alien/plasmavessel
	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/repulse/xeno(src))
	..()

/mob/living/carbon/alien/humanoid/ravager/handle_hud_icons_health()
	if (healths)
		if(stat != DEAD)
			switch(health)
				if(350 to INFINITY)
					healths.icon_state = "health0"
				if(300 to 350)
					healths.icon_state = "health1"
				if(200 to 300)
					healths.icon_state = "health2"
				if(100 to 200)
					healths.icon_state = "health3"
				if(50 to 100)
					healths.icon_state = "health4"
				if(0 to 50)
					healths.icon_state = "health5"
				else
					healths.icon_state = "health6"
		else
			healths.icon_state = "health7"

/mob/living/carbon/alien/humanoid/ravager/adjustFireLoss(amount) // Resistant to Fire
	if(amount > 0)
		..(amount * 0.25) //half normal damage; 1/4 of the double damage it already gets normally
	else
		..(amount)
	return
/*
/mob/living/carbon/alien/humanoid/ravager/adjustBruteLoss(amount) // Resistant to Brute
	if(amount > 0)
		..(amount * 0.75)
	else
		..(amount)
	return
*/

/turf/simulated/wall/attack_alien(mob/user)
	..(user, 1)
	if(isalienravager(user))
		if(prob(hardness))
			playsound(src, 'sound/effects/meteorimpact.ogg', 100, 1)
			user.do_attack_animation(src)
			user << text("<span class='notice'>You smash through the wall.</span>")
			user.say("*roar")
			dismantle_wall(1)

		else
			playsound(src, 'sound/effects/wallbang.ogg', 100, 1)
			user.do_attack_animation(src)
			user << text("<span class='notice'>You smash into the wall.</span>")
	else
		user << text("<span class='notice'>This wall is too strong for you to smash through. You smash it anyway.</span>")
		playsound(src, 'sound/effects/wallbang.ogg', 100, 1)
		user.do_attack_animation(src)
	return 1

obj/structure/falsewall/attack_alien(mob/living/carbon/alien/humanoid/user)
	..(user, 1)
	playsound(src, 'sound/effects/meteorimpact.ogg', 100, 1)
	user.do_attack_animation(src)
	user << text("<span class='notice'>You easily smash through and destroy the false wall.</span>")
	user.say("*roar")
	qdel(src)

/obj/structure/girder/attack_alien(mob/living/carbon/alien/humanoid/user)
	..(user, 1)
	playsound(src, 'sound/effects/meteorimpact.ogg', 100, 1)
	user.do_attack_animation(src)
	user << text("<span class='notice'>You easily smash through and destroy the flimsy girder.</span>")
	state = GIRDER_DISASSEMBLED
	user.say("*roar")
	qdel(src)