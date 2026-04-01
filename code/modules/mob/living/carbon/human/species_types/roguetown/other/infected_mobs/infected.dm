/mob/living/carbon/human/species/infected
	race = /datum/species/infected
	footstep_type = FOOTSTEP_MOB_CLAW
	var/datum/language_holder/stored_language
	var/list/stored_skills
	var/list/stored_experience

/mob/living/carbon/human/species/infected/male
	gender = MALE

/mob/living/carbon/human/species/infected/female
	gender = FEMALE

/datum/species/infected
	name = "Infected Mobs"
	id = "infected"
	species_traits = list(NO_UNDERWEAR, NO_ORGAN_FEATURES, NO_BODYPART_FEATURES, NOEYESPRITES)
	inherent_traits = list(
		TRAIT_STRONGBITE,
		TRAIT_ZJUMP,
		TRAIT_NOFALLDAMAGE1,
		TRAIT_INFINITE_STAMINA,
		TRAIT_BASHDOORS,
		TRAIT_SHOCKIMMUNE,
		TRAIT_STEELHEARTED,
		TRAIT_BREADY,
		TRAIT_ORGAN_EATER,
		TRAIT_NASTY_EATER,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_IGNOREDAMAGESLOWDOWN,
		TRAIT_HARDDISMEMBER, //Necessary for mobs with non modular sprites. Shits fuckd otherwise
		TRAIT_PIERCEIMMUNE, //Prevents weapon dusting and caltrop effects due to them transforming when killed/stepping on shards.
		TRAIT_IGNORESLOWDOWN,
		TRAIT_LONGSTRIDER,
		TRAIT_NOPAIN,
		TRAIT_NOPAINSTUN,
	)
	inherent_biotypes = MOB_HUMANOID
	armor = 30
	no_equip = list(SLOT_SHIRT, SLOT_HEAD, SLOT_WEAR_MASK, SLOT_ARMOR, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS, SLOT_CLOAK, SLOT_BELT, SLOT_BACK_R, SLOT_BACK_L, SLOT_S_STORE)
	nojumpsuit = 1
	sexes = 1
	offset_features = list(OFFSET_HANDS = list(0,2), OFFSET_HANDS_F = list(0,2))
	soundpack_m = /datum/voicepack/zombie/m
	soundpack_f = /datum/voicepack/zombie/f
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/night_vision/nightmare,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
	)

	languages = list(
		/datum/language/xenocommon
	)

/datum/species/infected/send_voice(mob/living/carbon/human/H)
	playsound(get_turf(H), pick('sound/vo/mobs/spider/speak (1).ogg','sound/vo/mobs/spider/speak (2).ogg', 'sound/vo/mobs/spider/speak (3).ogg', 'sound/vo/mobs/spider/speak (4).ogg'), 100, TRUE, -1)

/datum/species/infected/regenerate_icons(mob/living/carbon/human/H)
	H.icon = 'icons/roguetown/mob/monster/infected_mobs.dmi'
	H.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, INTENT_HARM)
	H.icon_state = "infected"
	return TRUE

/datum/species/infected/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/* When we get wounded overlays we can put these in, but for now nothing
/datum/species/infected/update_damage_overlays(mob/living/carbon/human/H)
	H.remove_overlay(DAMAGE_LAYER)
	var/list/hands = list()
	var/mutable_appearance/inhand_overlay = mutable_appearance("[H.icon_state]-dam", layer=-DAMAGE_LAYER)
	var/burnhead = 0
	var/brutehead = 0
	var/burnch = 0
	var/brutech = 0
	var/obj/item/bodypart/affecting = H.get_bodypart(BODY_ZONE_HEAD)
	if(affecting)
		burnhead = (affecting.burn_dam / affecting.max_damage)
		brutehead = (affecting.brute_dam / affecting.max_damage)
	affecting = H.get_bodypart(BODY_ZONE_CHEST)
	if(affecting)
		burnch = (affecting.burn_dam / affecting.max_damage)
		brutech = (affecting.brute_dam / affecting.max_damage)
	var/usedloss = 0
	if(burnhead > usedloss)
		usedloss = burnhead
	if(brutehead > usedloss)
		usedloss = brutehead
	if(burnch > usedloss)
		usedloss = burnch
	if(brutech > usedloss)
		usedloss = brutech
	inhand_overlay.alpha = 255 * usedloss
	testing("damalpha [inhand_overlay.alpha]")
	hands += inhand_overlay
	H.overlays_standing[DAMAGE_LAYER] = hands
	H.apply_overlay(DAMAGE_LAYER)
	return TRUE
*/
/* Not sure if I should have this but commenting it for now
/datum/species/infected/random_name(gender,unique,lastname)
	return "VEREWOLF"
*/

/obj/item/clothing/suit/roguetown/armor/skin_armor/infected_carpace
	slot_flags = null
	name = "\improper common infected's carpace"
	desc = ""
	icon_state = null
	body_parts_covered = FULL_BODY
	body_parts_inherent = FULL_BODY
	armor = ARMOR_PADDED
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	sewrepair = FALSE
	max_integrity = 150
	item_flags = DROPDEL


//Infection Proc, used for specifying transformation stuff.
/mob/living/carbon/human/proc/infected_transform()
	if(!mind)
		log_runtime("NO MIND ON [src.name] WHEN TRANSFORMING")
		return

	var/datum/antagonist/werewolf/Were = src.mind.has_antag_datum(/datum/antagonist/werewolf/)
	var/datum/antagonist/werewolf/lesser/Wereless = src.mind.has_antag_datum(/datum/antagonist/werewolf/lesser/)

	Paralyze(1, ignore_canstun = TRUE)
	for(var/obj/item/W in src)
		dropItemToGround(W)
	regenerate_icons()
	icon = null
	var/oldinv = invisibility
	invisibility = INVISIBILITY_MAXIMUM
	cmode = FALSE
	if(client)
		SSdroning.play_area_sound(get_area(src), client)
//	stop_cmusic()

//	src.fully_heal(FALSE) Removing this so that you don't have transformation as an easy change

	var/ww_path
	if(gender == MALE)
		ww_path = /mob/living/carbon/human/species/werewolf/male
	else
		ww_path = /mob/living/carbon/human/species/werewolf/female

	var/mob/living/carbon/human/species/werewolf/W = new ww_path(loc)

	W.set_patron(src.patron)
	W.gender = gender
	W.regenerate_icons()
	W.stored_mob = src
	W.limb_destroyer = TRUE
	W.ambushable = FALSE
	W.cmode_music = 'sound/music/cmode/antag/combat_darkstar.ogg'
	W.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/werewolf_skin(W)
	playsound(W.loc, pick('sound/combat/gib (1).ogg','sound/combat/gib (2).ogg'), 200, FALSE, 3)
	W.spawn_gibs(FALSE)
	src.forceMove(W)

	W.after_creation()
	//Checks if they're a Lesser werewolf or not
	if(Wereless && !Were)
		W.real_name = src.real_name
		W.name = src.name
/*
	W.stored_language = new
	W.stored_language.copy_known_languages_from(src)
*/
	W.stored_skills = ensure_skills().known_skills.Copy()
	W.stored_experience = ensure_skills().skill_experience.Copy()

	W.cmode_music_override = cmode_music_override
	W.cmode_music_override_name = cmode_music_override_name
	mind.transfer_to(W)
/*
	skills?.known_skills = list()
	skills?.skill_experience = list()
*/
	W.grant_language(/datum/language/beast)

	W.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, INTENT_HARM)
	W.update_a_intents()

	to_chat(W, span_userdanger("I transform into a horrible beast!"))
	W.emote("rage")

	if(getorganslot(ORGAN_SLOT_PENIS))
		W.internal_organs_slot[ORGAN_SLOT_PENIS] = /obj/item/organ/penis/knotted/big
	if(getorganslot(ORGAN_SLOT_TESTICLES))
		W.internal_organs_slot[ORGAN_SLOT_TESTICLES] = /obj/item/organ/testicles
	if(getorganslot(ORGAN_SLOT_BREASTS))
		W.internal_organs_slot[ORGAN_SLOT_BREASTS] = /obj/item/organ/breasts
	if(getorganslot(ORGAN_SLOT_VAGINA))
		W.internal_organs_slot[ORGAN_SLOT_VAGINA] = /obj/item/organ/vagina

	W.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	W.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	W.adjust_skillrank(/datum/skill/misc/climbing, 6, TRUE)
	W.adjust_skillrank(/datum/skill/misc/swimming, 5, TRUE)

	W.STASTR = 18
	W.STAPER = src.STAPER
	W.STAINT = src.STAINT
	W.STALUC = src.STALUC
	W.STASPD = src.STASPD
	W.STACON = 16
	W.STAEND = 18

	W.AddSpell(new /obj/effect/proc_holder/spell/self/howl)
	W.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	W.AddSpell(new /obj/effect/proc_holder/spell/targeted/woundlick)

	ADD_TRAIT(src, TRAIT_NOSLEEP, TRAIT_GENERIC)
//	ADD_TRAIT(W, TRAIT_GRABIMMUNE, TRAIT_GENERIC) // THIS IS THE CORRECT PLACE FOR WEREWOLF TRAITS. GOD. Make it more balanced
	ADD_TRAIT(W, TRAIT_STRONGBITE, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_ZJUMP, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_SHOCKIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_ORGAN_EATER, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_IGNORESLOWDOWN, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_HARDDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_PIERCEIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_SPELLCOCKBLOCK, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
	ADD_TRAIT(W, TRAIT_DEATHBYSNUSNU, TRAIT_GENERIC)

	invisibility = oldinv
