/mob/living/simple_animal/pokemon
	desc = "Gotta catch 'em all!"
	icon = 'icons/mob/pokemon.dmi'
	pixel_x = -16
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 4)
	ventcrawler = 2
	health = 50
	maxHealth = 50
	layer = 5
	response_help   = "pets"
	wander = 1
	turns_per_move = 5
	pass_flags = PASSTABLE | PASSMOB
/* /////TEMPLATE/////
/mob/living/simple_animal/pokemon/
	name = ""
	icon_state = ""
	icon_living = ""
	icon_dead = ""
*/
/mob/living/simple_animal/pokemon/leg/
	icon = 'icons/mob/legendary.dmi'
	pixel_x = -32
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 12)
	health = 150
	maxHealth = 150

/mob/living/simple_animal/pokemon/leg/articuno
	name = "Articuno"
	icon_state = "articuno"
	icon_living = "articuno"
	icon_dead = "articuno_d"
	flying = 1

/mob/living/simple_animal/pokemon/leg/rayquaza
	name = "Rayquaza"
	icon_state = "rayquaza"
	icon_living = "rayquaza"
	icon_dead = "rayquaza_d"
	flying = 1

/mob/living/simple_animal/pokemon/dratini
	name = "dratini"
	icon_state = "dratini"
	icon_living = "dratini"
	icon_dead = "dratini_d"

/mob/living/simple_animal/pokemon/dratini/dragonair
	name = "dragonair"
	icon_state = "dragonair"
	icon_living = "dragonair"
	icon_dead = "dragonair_d"

/mob/living/simple_animal/pokemon/dratini/dragonair/dragonite
	name = "dragonite"
	icon_state = "dragonite"
	icon_living = "dragonite"
	icon_dead = "dragonite_d"

/mob/living/simple_animal/pokemon/absol
	name = "absol"
	icon_state = "absol"
	icon_living = "absol"
	icon_dead = "absol_d"
	speak = list("Absol!", "Ab-Absol!")

/mob/living/simple_animal/pokemon/eevee
	name = "eevee"
	icon_state = "eevee"
	icon_living = "eevee"
	icon_dead = "eevee_d"
	speak = list("Eevee!", "Ee-Eevee!")
	response_help  = "pets"
	response_disarm = "gently moves aside"
	response_harm   = "hits"
	turns_per_move = 5
	pass_flags = PASSTABLE | PASSMOB

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
	icon_living = "espeon"

/mob/living/simple_animal/pokemon/eevee/umbreon
	name = "umbreon"
	icon_state = "umbreon"
	icon_dead = "umbreon_d"
	icon_living = "umbreon"

/mob/living/simple_animal/pokemon/poochyena
	name = "poochyena"
	icon_state = "poochyena"
	icon_living = "poochyena"
	icon_dead = "poochyena_d"

/mob/living/simple_animal/pokemon/poochyena/mightyena
	name = "mightyena"
	icon_state = "mightyena"
	icon_living = "mightyena"
	icon_dead = "mightyena"

/mob/living/simple_animal/pokemon/vulpix
	name = "vulpix"
	icon_state = "vulpix"
	icon_living = "vulpix"
	icon_dead = "vulpix_d"

/mob/living/simple_animal/pokemon/larvitar
	name = "larvitar"
	icon_state = "larvitar"
	icon_living = "larvitar"
	icon_dead = "larvitar_d"

/mob/living/simple_animal/pokemon/ditto
	name = "ditto"
	icon_state = "ditto"
	icon_living = "ditto"
	icon_dead = "ditto_d"

/mob/living/simple_animal/pokemon/charmander
	name = "charmander"
	icon_state = "charmander"
	icon_living = "charmander"
	icon_dead = "charmander_d"