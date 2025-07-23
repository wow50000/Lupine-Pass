#define VALID_FISHING_SPOTS list(\
	/turf/open/water/river,\
	/turf/open/water/cleanshallow,\
	/turf/open/water/ocean,\
	/turf/open/water/ocean/deep,\
	/turf/open/water/swamp,\
	/turf/open/water/swamp/deep )

//Valid spots for fishing add to it if there's more.
/proc/is_valid_fishing_spot(turf/T)
	for(var/i in VALID_FISHING_SPOTS)
		if(istype(T, i))
			return TRUE
	return FALSE

var/fishing_weights = list(
		"ultra_common" = 1000,
		"very_common" = 875,
		"common" = 750,
		"moderately_common" = 625,
		"uncommon" = 500,
		"scarce" = 375,
		"very_scarce" = 250,
		"ultra_scarce" = 125,
		"rare" = 50,
		"very_rare" = 25,
		"ultra_rare" = 10,
		"rat" = 1
	)

/proc/createFreshWaterFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod, ceruleanMod)
	var/weightList = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 750*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/sunny = 1000*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/salmon = 450*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/eel = 600*commonMod,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 5*treasureMod,
		/obj/item/clothing/ring/gold = 3*treasureMod+45*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 3*treasureMod+150*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 30*ceruleanMod,
		/obj/item/grown/log/tree/stick = 5*trashMod,
		/obj/item/natural/cloth = 5*trashMod,
		/obj/item/ammo_casing/caseless/rogue/arrow = 5*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue = 5*trashMod,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a fish...?
 		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 75,
	)
	return counterlist_ceiling(weightList)

/proc/createFreshWaterFishWeightListBaited(list/baitMod) (
	. = createFreshWaterFishWeightList(baitMod["commonFishingMod"],baitMod["rareFishingMod"],baitMod["treasureFishingMod"],baitMod["trashFishingMod"],baitMod["dangerFishingMod"],baitMod["ceruleanFishingMod"])
)

/proc/createCoastalSeaFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod, ceruleanMod)
	var/weightList = list (
		/obj/item/reagent_containers/food/snacks/fish/cod = 700*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 300*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/sole = 1000*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/angler = 300*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 300*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/bass = 700*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/clam = 100*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 50*rareMod + 150*ceruleanMod,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 5*treasureMod + 60*ceruleanMod,
		/obj/item/clothing/ring/gold = 3*treasureMod + 75*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 3*treasureMod + 200*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 75*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/rich = 30*ceruleanMod,
		/obj/item/grown/log/tree/stick =  5*trashMod,
		/obj/item/natural/cloth = 5*trashMod,
		/obj/item/ammo_casing/caseless/rogue/arrow = 5*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue = 5*trashMod,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a coastal fish...?
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 75,
	)
	return counterlist_ceiling(weightList)

/proc/createCoastalSeaFishWeightListBaited(list/baitMod) (
	. = createCoastalSeaFishWeightList(baitMod["commonFishingMod"],baitMod["rareFishingMod"],baitMod["treasureFishingMod"],baitMod["trashFishingMod"],baitMod["dangerFishingMod"],baitMod["ceruleanFishingMod"])
)

/proc/createDeepSeaFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod, ceruleanMod)
	var/weightList = list (
		/obj/item/reagent_containers/food/snacks/fish/cod = 300*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 600*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/sole = 200*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/angler = 600*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 500*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/bass = 300*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/clam = 400*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 100*rareMod + 150*ceruleanMod,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 10*treasureMod + 60*ceruleanMod,
		/obj/item/clothing/ring/gold = 5*treasureMod + 75*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 5*treasureMod + 200*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 75*ceruleanMod,
		/obj/item/storage/belt/rogue/pouch/coins/rich = 30*ceruleanMod,
		/obj/item/reagent_containers/glass/bottle/rogue = 10*trashMod,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a deep sea fish...?
		/mob/living/carbon/human/species/goblin/npc/sea = 100*dangerMod,
		/mob/living/simple_animal/hostile/rogue/deepone = 200*dangerMod,
		/mob/living/simple_animal/hostile/rogue/deepone/spit = 200*dangerMod,
	)
	return counterlist_ceiling(weightList)

/proc/createDeepSeaFishWeightListBaited(list/baitMod) (
	. = createDeepSeaFishWeightList(baitMod["commonFishingMod"],baitMod["rareFishingMod"],baitMod["treasureFishingMod"],baitMod["trashFishingMod"],baitMod["dangerFishingMod"],baitMod["ceruleanFishingMod"])
)

/proc/createMudFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod, ceruleanMod)
	var/weightList = list (
		/obj/item/reagent_containers/food/snacks/fish/mudskipper = 800*commonMod,
		/obj/item/natural/worms/leech = 200*rareMod,
 		/obj/item/clothing/ring/gold = 5*treasureMod + 75*ceruleanMod,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //Thats one dirty... not a fish...?
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 75,	
	)
	return counterlist_ceiling(weightList)

/proc/createMudFishWeightListBaited(list/baitMod) (
	. = createMudFishWeightList(baitMod["commonFishingMod"],baitMod["rareFishingMod"],baitMod["treasureFishingMod"],baitMod["trashFishingMod"],baitMod["dangerFishingMod"],baitMod["ceruleanFishingMod"])
)

/proc/createCageFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod, ceruleanMod)
	var/weightList = list(
			/obj/item/reagent_containers/food/snacks/fish/oyster = 200*commonMod,
			/obj/item/reagent_containers/food/snacks/fish/shrimp = 200*commonMod,
			/obj/item/reagent_containers/food/snacks/fish/crab = 200*rareMod,
			/obj/item/reagent_containers/food/snacks/fish/lobster = 200*commonMod,
			/obj/item/reagent_containers/food/snacks/smallrat = 1, //Oh for fucks sake!
		)	
	return counterlist_ceiling(weightList)

/proc/createCageFishWeightListBaited(list/baitMod) (
	. = createCageFishWeightList(baitMod["commonFishingMod"],baitMod["rareFishingMod"],baitMod["treasureFishingMod"],baitMod["trashFishingMod"],baitMod["dangerFishingMod"],baitMod["ceruleanFishingMod"])
)
