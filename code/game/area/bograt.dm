//bog for rockhill - milder spawns than in dunworld

/area/rogue/outdoors/bograt
	name = "Rockhill Bog"
	icon_state = "bog"
	warden_area = TRUE
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	warden_area = TRUE
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/troll/bog = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 40,
				/mob/living/carbon/human/species/skeleton/npc/bogguard = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf_undead = 10,
				new /datum/ambush_config/bog_guard_deserters = 50,
				new /datum/ambush_config/bog_guard_deserters/hard = 25,
				new /datum/ambush_config/mirespiders_ambush = 110,
				new /datum/ambush_config/mirespiders_crawlers = 25,
				new /datum/ambush_config/mirespiders_aragn = 10,
				new /datum/ambush_config/mirespiders_unfair = 5)
	first_time_text = "THE TERRORBOG"
	converted_type = /area/rogue/indoors/shelter/bograt
	deathsight_message = "a wretched, fetid bog"
	threat_region = THREAT_REGION_TERRORBOG

/area/rogue/indoors/shelter/bograt
	name = "Rockhill Bog"
	icon_state = "bog"
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	threat_region = THREAT_REGION_TERRORBOG

/area/rogue/outdoors/bograt/north
	name = "Northern Terrorbog"
	//threat_region = THREAT_REGION_OUTER_GROVE //Might want to make it less dangerous than the areas further from town?

/area/rogue/outdoors/bograt/east
	name = "Eastern Terrorbog"
	
/area/rogue/outdoors/bograt/south
	name = "Southern Terrorbog"

/area/rogue/outdoors/bograt/west
	name = "Western Terrorbog"
