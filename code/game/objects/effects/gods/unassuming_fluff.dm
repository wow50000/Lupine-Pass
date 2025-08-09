/obj/effect/dream_horror
	name = "Dream Horror"
	desc = "?????"
	icon = 'icons/effects/dad.dmi'

/obj/effect/dream_horror/Initialize()
	. = ..()
	if(prob(1))
		name = "Dad"
		desc = "Dad is back! He even brought the milk!"

/datum/stressevent/dream_horror
	timer = -1
	stressadd = 20
	desc = span_userdanger("WHAT IS THAT THING?!")


