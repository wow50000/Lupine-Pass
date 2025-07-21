/obj/item
	var/baitpenalty = 100 // Using this as bait will incurr a penalty to fishing chance. 100 makes it useless as bait. Lower values are better, but Never make it past 10.
	var/isbait = FALSE	// Is the item in question bait to be used?
	var/list/freshfishloot = null
	var/list/coastalseafishloot = null
	var/list/deepseafishloot = null
	var/list/mudfishloot = null
	var/list/fishloot = null
	var/list/cageloot = null	

/obj/item/natural/worms
	name = "worm"
	desc = "The favorite bait of the courageous fishermen who venture these dark waters."
	icon_state = "worm1"
	throwforce = 10
	baitpenalty = 10
	isbait = TRUE
	color = "#985544"
	w_class = WEIGHT_CLASS_TINY
	freshfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 225,
		/obj/item/reagent_containers/food/snacks/fish/sunny = 325,
		/obj/item/reagent_containers/food/snacks/fish/salmon = 190,
		/obj/item/reagent_containers/food/snacks/fish/eel = 140,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,	
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 20,			
	)
	coastalseafishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/cod = 190,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 231,
		/obj/item/reagent_containers/food/snacks/fish/sole = 340,
		/obj/item/reagent_containers/food/snacks/fish/angler = 42,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 60,
		/obj/item/reagent_containers/food/snacks/fish/bass = 210,
		/obj/item/reagent_containers/food/snacks/fish/clam = 12,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 6,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a coastal fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 25,
	)
	deepseafishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/cod = 95,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 105,
		/obj/item/reagent_containers/food/snacks/fish/sole = 102,
		/obj/item/reagent_containers/food/snacks/fish/angler = 196,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 195,
		/obj/item/reagent_containers/food/snacks/fish/bass = 126,
		/obj/item/reagent_containers/food/snacks/fish/clam = 80,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 40,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 10,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 5,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 1,
		/obj/item/clothing/ring/gold = 5,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a deepfish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/mob/living/carbon/human/species/goblin/npc/sea = 45,
		/mob/living/simple_animal/hostile/rogue/deepone = 50,
		/mob/living/simple_animal/hostile/rogue/deepone/spit = 50,
	)
	mudfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/mudskipper = 200,
		/obj/item/natural/worms/leech = 50,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //Thats one dirty... not a fish...?
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 25,				
	)
	// This is super trimmed down from the ratwood list to focus entirely on shellfishes
	cageloot = list(
		/obj/item/reagent_containers/food/snacks/fish/oyster = 214,
		/obj/item/reagent_containers/food/snacks/fish/shrimp = 214,
		/obj/item/reagent_containers/food/snacks/fish/crab = 214,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 214,
	)	
	drop_sound = 'sound/foley/dropsound/food_drop.ogg'
	var/amt = 1

/obj/item/natural/worms/grubs
	name = "grub"
	desc = "Bait for the desperate, or the daring."
	baitpenalty = 5
	isbait = TRUE
	color = null
	freshfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 200,
		/obj/item/reagent_containers/food/snacks/fish/sunny = 305,
		/obj/item/reagent_containers/food/snacks/fish/salmon = 210,
		/obj/item/reagent_containers/food/snacks/fish/eel = 160,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 20,				
	)
	coastalseafishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/cod = 230,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 198,
		/obj/item/reagent_containers/food/snacks/fish/sole = 250,
		/obj/item/reagent_containers/food/snacks/fish/angler = 51,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 72,
		/obj/item/reagent_containers/food/snacks/fish/bass = 230,
		/obj/item/reagent_containers/food/snacks/fish/clam = 15,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 12,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a coastal fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 25,
	)
	deepseafishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/cod = 115,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 90,
		/obj/item/reagent_containers/food/snacks/fish/sole = 75,
		/obj/item/reagent_containers/food/snacks/fish/angler = 238,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 234,
		/obj/item/reagent_containers/food/snacks/fish/bass = 138,
		/obj/item/reagent_containers/food/snacks/fish/clam = 100,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 80,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 10,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 5,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 1,
		/obj/item/clothing/ring/gold = 5,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a deepfish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/mob/living/carbon/human/species/goblin/npc/sea = 45,
		/mob/living/simple_animal/hostile/rogue/deepone = 50,
		/mob/living/simple_animal/hostile/rogue/deepone/spit = 50,
	)
	mudfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/mudskipper = 200,
		/obj/item/natural/worms/leech = 50,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //Thats one dirty... not a fish...?
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 25,				
	)	
/obj/item/natural/worms/grubs/attack_right(mob/user)
	return

/obj/item/natural/worms/Initialize()
	. = ..()
	dir = rand(0,8)
