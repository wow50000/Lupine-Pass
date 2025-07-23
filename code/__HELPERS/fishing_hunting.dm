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

/proc/createFreshWaterFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod)
	var/weightList = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = fishing_weights["very_common"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/sunny = fishing_weights["ultra_common"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/salmon = fishing_weights["moderately_common"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/eel = fishing_weights["moderately_common"]*commonMod,
		/obj/item/grown/log/tree/stick =  fishing_weights["ultra_rare"]*trashMod,
		/obj/item/natural/cloth = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/ammo_casing/caseless/rogue/arrow = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/clothing/ring/gold = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/storage/belt/rogue/pouch/coins/poor = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/reagent_containers/food/snacks/smallrat = fishing_weights["rat"], //That's not a fish...?
 		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = fishing_weights["rare"],
	)
	return counterlist_ceiling(weightList)

/proc/createCoastalSeaFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod)
	var/weightList = list (
		/obj/item/reagent_containers/food/snacks/fish/cod = fishing_weights["common"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/plaice = fishing_weights["uncommon"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/sole = fishing_weights["very_common"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/angler = fishing_weights["scarce"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/lobster = fishing_weights["scarce"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/bass = fishing_weights["common"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/clam = fishing_weights["rare"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = fishing_weights["very_rare"]*rareMod,
		/obj/item/grown/log/tree/stick =  fishing_weights["ultra_rare"]*trashMod,
		/obj/item/natural/cloth = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/ammo_casing/caseless/rogue/arrow = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/clothing/ring/gold = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/storage/belt/rogue/pouch/coins/poor = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/reagent_containers/food/snacks/smallrat = fishing_weights["rat"], //That's not a coastal fish...?
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = fishing_weights["rare"],
	)
	return counterlist_ceiling(weightList)

/proc/createDeepSeaFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod)
	var/weightList = list (
		/obj/item/reagent_containers/food/snacks/fish/cod = fishing_weights["scarce"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/plaice = fishing_weights["moderately_common"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/sole = fishing_weights["scarce"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/angler = fishing_weights["moderately_common"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/lobster = fishing_weights["uncommon"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/bass = fishing_weights["scarce"]*commonMod,
		/obj/item/reagent_containers/food/snacks/fish/clam = fishing_weights["uncommon"]*rareMod,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = fishing_weights["scarce"]*rareMod,
		/obj/item/grown/log/tree/stick =  fishing_weights["ultra_rare"]*trashMod,
		/obj/item/natural/cloth = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/ammo_casing/caseless/rogue/arrow = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue = fishing_weights["ultra_rare"]*trashMod,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/clothing/ring/gold = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/storage/belt/rogue/pouch/coins/poor = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/reagent_containers/food/snacks/smallrat = fishing_weights["rat"], //That's not a coastal fish...?
		/mob/living/carbon/human/species/goblin/npc/sea = fishing_weights["scarce"]*dangerMod,
		/mob/living/simple_animal/hostile/rogue/deepone = fishing_weights["very_scarce"]*dangerMod,
		/mob/living/simple_animal/hostile/rogue/deepone/spit = fishing_weights["very_scarce"]*dangerMod,
	)
	return counterlist_ceiling(weightList)

/proc/createMudFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod)
	var/weightList = list (
		/obj/item/reagent_containers/food/snacks/fish/mudskipper = fishing_weights["common"]*commonMod,
		/obj/item/natural/worms/leech = fishing_weights["very_scarce"]*rareMod,
		/obj/item/clothing/ring/gold = fishing_weights["ultra_rare"]*treasureMod,
		/obj/item/reagent_containers/food/snacks/smallrat = fishing_weights["rat"], //Thats one dirty... not a fish...?
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = fishing_weights["rare"],	
	)
	return counterlist_ceiling(weightList)

/proc/createCageFishWeightList(commonMod, rareMod, treasureMod, trashMod, dangerMod)
	var/weightList = list(
			/obj/item/reagent_containers/food/snacks/fish/oyster = fishing_weights["common"]*commonMod,
			/obj/item/reagent_containers/food/snacks/fish/shrimp = fishing_weights["common"]*commonMod,
			/obj/item/reagent_containers/food/snacks/fish/crab = fishing_weights["common"]*rareMod,
			/obj/item/reagent_containers/food/snacks/fish/lobster = fishing_weights["common"]*commonMod,
			/obj/item/reagent_containers/food/snacks/smallrat = fishing_weights["rat"], //Oh for fucks sake!
		)	
	return counterlist_ceiling(weightList)
