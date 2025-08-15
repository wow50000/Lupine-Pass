#define WEATHER_RAIN "rain"

// The immovable chair structure
/obj/structure/chair/frankenstein
	name = "grotesque reanimation chair"
	desc = "A nightmarish contraption of leather straps, fluid tanks, and sparking electrodes. It seems permanently fixed to the ground."
	icon = 'icons/roguetown/misc/struc48x48.dmi'
	icon_state = "frankenchair0"
	anchored = TRUE
	density = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	max_integrity = 10000
	item_chair = null // Cannot be picked up
	buildstacktype = null
	buildstackamount = 0

	// Chair state variables
	var/charge = 0
	var/max_charge = 100
	var/brew_required = 48
	var/current_brew = 0
	var/max_brew = 96

	var/static/list/brew_overlays = list(
		"low" = "frankenbrew_low",
		"medium" = "frankenbrew_med",
		"high" = "frankenbrew_high"
	)
	var/brew_color = "#00ff15"
	var/brew_alpha = 200
	pixel_x = -8

/obj/structure/chair/frankenstein/Initialize()
	. = ..()
	update_icon()

/obj/structure/chair/frankenstein/update_icon()
	cut_overlays()
	icon_state = "frankenchair0" // Reset base state

	// Add fluid overlay if there's brew
	if(current_brew > 0)
		var/brew_percent = current_brew / max_brew
		var/overlay_state

		// Select appropriate overlay based on fill level
		if(brew_percent < 0.33)
			overlay_state = brew_overlays["low"]
		else if(brew_percent < 0.66)
			overlay_state = brew_overlays["medium"]
		else
			overlay_state = brew_overlays["high"]

		// Create and apply overlay
		var/mutable_appearance/fluid_overlay = mutable_appearance(icon, overlay_state)
		fluid_overlay.color = brew_color
		fluid_overlay.alpha = brew_alpha
		add_overlay(fluid_overlay)

	// Add charge effects if charged
	if(charge > 0)
		var/charge_percent = charge / max_charge
		var/charge_alpha = 55 + 200 * charge_percent
		var/mutable_appearance/charge_overlay = mutable_appearance(icon, "frankenspark")
		charge_overlay.alpha = charge_alpha
		add_overlay(charge_overlay)

/obj/structure/chair/frankenstein/attackby(obj/item/I, mob/user)
	// Handle filling with brew containers
	if(istype(I, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/container = I

		// Check if container has our special brew
		if(container.reagents.has_reagent(/datum/reagent/frankenbrew, 1))
			if(current_brew >= max_brew)
				to_chat(user, span_warning("[src] is completely full!"))
				return

			// Calculate how much we can transfer
			var/remaining_capacity = max_brew - current_brew
			var/available_brew = container.reagents.get_reagent_amount(/datum/reagent/frankenbrew)

			if(available_brew <= 0)
				to_chat(user, span_warning("[container] is empty!"))
				return

			// Animate filling
			user.visible_message(span_notice("[user] begins filling [src] with [container]."), 
								span_notice("You begin filling [src] with [container]."))

			var/transferred = 0
			var/transfer_amount = 3
			var/transfer_time = 2 SECONDS

			while(remaining_capacity > 0 && available_brew > 0)
				// Check if we can continue
				if(!user.Adjacent(src) || !container)
					break

				// Calculate actual transfer for this iteration
				var/actual_transfer = min(transfer_amount, remaining_capacity, available_brew)

				// Short transfer animation
				if(!do_after(user, transfer_time, target = src))
					break

				// Transfer fluid
				container.reagents.remove_reagent(/datum/reagent/frankenbrew, actual_transfer)
				current_brew += actual_transfer
				transferred += actual_transfer
				remaining_capacity = max_brew - current_brew
				available_brew = container.reagents.get_reagent_amount(/datum/reagent/frankenbrew)

				// Update appearance
				update_icon()
				playsound(src, 'sound/items/drink_bottle (2).ogg', 30, TRUE)

			if(transferred > 0)
				to_chat(user, span_notice("You transfer [transferred] units of elixir to [src]. It now has [current_brew]/[max_brew] units."))
			else
				to_chat(user, span_warning("You were interrupted while filling [src]."))

			update_icon()
			return TRUE
		else
			to_chat(user, span_warning("This container doesn't have the special brew!"))
			return

	// Handle cranking mechanism
	if(istype(I, /obj/item))
		if(charge >= max_charge)
			to_chat(user, span_warning("[src] is already fully charged!"))
			return

		user.visible_message(span_notice("[user] begins cranking [src]."), 
							span_notice("You start cranking [src]..."))

		if(do_after(user, 5 SECONDS, target = src))
			charge = min(charge + 25, max_charge)
			to_chat(user, span_notice("You add charge to [src]. Current charge: [charge]/[max_charge]"))
			playsound(src, 'sound/misc/click.ogg', 50, 1)
			update_icon()
		return TRUE

	return ..()

/obj/structure/chair/frankenstein/examine(mob/user)
	. = ..()
	. += span_info("Fluid level: [current_brew]/[max_brew] units")
	. += span_info("Charge level: [charge]/[max_charge]")

	if(current_brew > 0)
		. += span_notice("The fluid tank contains a glowing green liquid.")
	else
		. += span_warning("The fluid tank is empty.")

// Special brew reagent
/datum/reagent/frankenbrew
	name = "Reanimation Elixir"
	description = "A volatile chemical mixture that reanimates biological tissue."
	color = "#00ff15"
	taste_description = "lightning and regret"

/obj/item/reagent_containers/glass/bottle/frankenbrew
	name = "vial of Reanimation Elixir"
	desc = "A volatile chemical mixture that reanimates biological tissue. Looks expensive..."
	list_reagents = list(/datum/reagent/frankenbrew = 48)
