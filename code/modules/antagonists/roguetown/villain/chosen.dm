/datum/antagonist/chosen
	name = "Chosen" // special role that basically just exists to give
	antag_memory = "<b>I have been CHOSEN for tasks by an external entity, or the TUMOR within my mind...</b>"
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "storyteller"
	job_rank = ROLE_CHOSEN // storytellers the ability to add objectives to whoever. this is probably
	show_in_roundend = FALSE // terrible because i dont know what the fuck i'm doing beyond  guessing and reading code.
	increase_votepwr = FALSE // like this, what does this do?
	rogue_enabled = TRUE // or this? I DONT KNOW BECAUSE THERES NO DOCUMENTATION

/datum/antagonist/chosen/on_gain()
	var/datum/objective/chosen/chosen_survive = new /datum/objective/chosen/chosen_survive()
	owner.add_objective(chosen_survive)
	greet()
	return ..()

/datum/antagonist/chosen/on_removal()
	to_chat(owner.current, span_userdanger("My tasks fade before me. What was I doing, again...?"))
	return ..()

/datum/antagonist/chosen/greet()
	owner.announce_objectives()
	return ..()

/datum/objective/chosen/chosen_survive
	name = "Survive"
	explanation_text = "My head pounds with VIGOR! I must survive to recieve further instructions."

