/mob/living/carbon/alien/humanoid/ravager
	name = "alien ravager"
	caste = "rav"
	maxHealth = 300
	health = 300
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "alienrav"
	heat_protection = 2 //the only fire resistant caste
	ventcrawler = 0
	pixel_x = -16
	mob_size = MOB_SIZE_LARGE
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/xeno = 20, /obj/item/stack/sheet/animalhide/xeno = 3)
	pressure_resistance = 200
	layer = 6
	move_delay_add = 1

/mob/living/carbon/alien/humanoid/ravager/movement_delay()
	. = ..()
	. += 1

/mob/living/carbon/alien/humanoid/ravager/New()

	real_name = name

	internal_organs += new /obj/item/organ/internal/alien/plasmavessel
	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/repulse/xeno(src))
	..()

/mob/living/carbon/alien/humanoid/ravager/handle_hud_icons_health()
	if (healths)
		if(stat != DEAD)
			switch(health)
				if(300 to INFINITY)
					healths.icon_state = "health0"
				if(250 to 300)
					healths.icon_state = "health1"
				if(200 to 250)
					healths.icon_state = "health2"
				if(150 to 200)
					healths.icon_state = "health3"
				if(100 to 150)
					healths.icon_state = "health4"
				if(0 to 100)
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