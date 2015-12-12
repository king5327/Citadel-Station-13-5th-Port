/mob/living/simple_animal/pokemon
	desc = "Gotta catch 'em all!"
	icon = 'icons/mob/pokemon.dmi'
	pixel_x = -16

/mob/living/simple_animal/pokemon/absol
	name = "absol"
	icon_state = "absol"
	icon_living = "absol"
	icon_dead = "absol_d"
	speak = list("Absol!", "Ab-Absol!")

/mob/living/simple_animal/pokemon/eevee/
	name = "eevee"
	icon_state = "eevee"
	icon_dead = "eevee_d"
	speak = list("Eevee!")
	health = 50
	maxHealth = 50
	response_help  = "pets"
	response_disarm = "gently moves aside"
	response_harm   = "hits"
	turns_per_move = 5
	pass_flags = PASSTABLE | PASSMOB
	ventcrawler = 2
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 4)

/mob/living/simple_animal/pokemon/eevee/glaceon
	name = "glaceon"
	icon_state = "glaceon"
	icon_living = "glaceon"
	icon_dead = "glaceon_d"
	speak = list("Glace!", "Glaceon!")

/mob/living/simple_animal/pokemon/eevee/jolteon
	name = "jolteon"
	icon_state = "jolteon"
	icon_living = "jolteon"
	icon_dead = "jolteon_d"
	speak = list("Jolt!", "Jolteon!")

/mob/living/simple_animal/pokemon/eevee/flareon
	name = "flareon"
	icon_state = "flareon"
	icon_living = "flareon"
	icon_dead = "flareon_d"
	speak = list("Flare!", "Flareon!")
/mob/living/simple_animal/pokemon/eevee/espeon
	name = "espeon"
	icon_state = "espeon"
	icon_dead = "espeon_d"
/mob/living/simple_animal/pokemon/eevee/umbreon
	name = "umbreon"
	icon_state = "umbreon"
	icon_dead = "umbreon_d"
