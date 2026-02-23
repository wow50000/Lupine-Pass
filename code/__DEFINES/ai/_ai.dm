#define GET_AI_BEHAVIOR(behavior_type) SSai_behaviors.ai_behaviors[behavior_type]
#define HAS_AI_CONTROLLER_TYPE(thing, type) istype(thing?.ai_controller, type)
#define AI_STATUS_ON		1
#define AI_STATUS_OFF		2
#define AI_STATUS_IDLE		3

///Carbon checks
#define SHOULD_RESIST(source) (source.on_fire || source.buckled || source.restrained() || (source.pulledby && source.pulledby.grab_state > GRAB_PASSIVE))
#define SHOULD_STAND(source) (source.resting)
#define IS_DEAD_OR_INCAP(source) (source.incapacitated() || source.stat)
#define IS_FLOORED(source) (source.IsKnockdown() && source.IsStun() && source.IsParalyzed())
// How far should we, by default, be looking for interesting things to de-idle?
#define AI_DEFAULT_INTERESTING_DIST 10

///Max pathing attempts before auto-fail
#define MAX_PATHING_ATTEMPTS 30
///Flags for ai_behavior new()
#define AI_CONTROLLER_INCOMPATIBLE (1<<0)

///Does this task require movement from the AI before it can be performed?
#define AI_BEHAVIOR_REQUIRE_MOVEMENT (1<<0)
///Does this require the current_movement_target to be adjacent and in reach?
#define AI_BEHAVIOR_REQUIRE_REACH (1<<1)
///Does this task let you perform the action while you move closer? (Things like moving and shooting)
#define AI_BEHAVIOR_MOVE_AND_PERFORM (1<<2)
///Does finishing this task not null the current movement target?
#define AI_BEHAVIOR_KEEP_MOVE_TARGET_ON_FINISH (1<<3)
///Does finishing this task make the AI stop moving towards the target?
#define AI_BEHAVIOR_KEEP_MOVING_TOWARDS_TARGET_ON_FINISH (1<<4)
///Does this behavior NOT block planning?
#define AI_BEHAVIOR_CAN_PLAN_DURING_EXECUTION (1<<5)

///Cooldown on planning if planning failed last time
#define AI_FAILED_PLANNING_COOLDOWN 1.5 SECONDS

///Subtree defines
///This subtree should cancel any further planning, (Including from other subtrees)
#define SUBTREE_RETURN_FINISH_PLANNING 1

///AI flags
#define STOP_MOVING_WHEN_PULLED (1<<0)

//Blackboard

//Generic BB keys
#define BB_CURRENT_MIN_MOVE_DISTANCE "min_move_distance"

/// Signal sent when a blackboard key is set to a new value
#define COMSIG_AI_BLACKBOARD_KEY_SET(blackboard_key) "ai_blackboard_key_set_[blackboard_key]"
#define COMSIG_AI_BLACKBOARD_KEY_CLEARED(blackboard_key) "ai_blackboard_key_clear_[blackboard_key]"

///Targetting keys for something to run away from, if you need to store this separately from current target
#define BB_BASIC_MOB_FLEE_TARGET "BB_basic_flee_target"
#define BB_BASIC_MOB_FLEE_TARGET_HIDING_LOCATION "BB_basic_flee_target_hiding_location"
#define BB_FLEE_TARGETTING_DATUM "flee_targetting_datum"

#define BB_FUTURE_MOVEMENT_PATH "BB_future_path"

///time until we should next eat, set by the generic hunger subtree
#define BB_NEXT_HUNGRY "BB_NEXT_HUNGRY"
///what we're going to eat next
#define BB_BASIC_MOB_FOOD_TARGET "BB_basic_food_target"
///what corpse we'll next try to eat
#define BB_BASIC_MOB_CORPSE_TARGET "BB_basic_mob_corpse_target"
///What creature we want to cocoon
#define BB_BASIC_MOB_COCOON_TARGET "BB_basic_mob_cocoon_target"
///Who we want dead above all else...
#define BB_MAIN_TARGET "BB_main_target"
///How many times we'll attack defendants before getting disinterested
#define BB_RETALIATE_ATTACKS_LEFT "BB_relatiate_attacks_left"
#define BB_RETALIATE_COOLDOWN "BB_retaliate_cooldown"

#define BB_BASIC_MOB_TAMED "BB_basic_mob_tamed"

#define BB_WANDER_POINT "BB_wander_point"

//farm animals ai
#define BB_CHICKEN_LAY_EGG "BB_chicken_lay_egg"
#define BB_CHICKEN_NESTING_BOX "BB_chicken_nest_box"
#define BB_COW_TIP_REACTING "BB_cow_tip_reacting"
#define	BB_COW_TIPPER "BB_cow_tipper"

//Move then recheck ai
#define MOVEMENT_LOOP_START_FAST (1<<0)


///                                                          /PORTS FROM VANDERLIN

///are we ready to breed?
#define BB_BREED_READY "BB_breed_ready"
///maximum kids we can have
#define BB_MAX_CHILDREN "BB_max_children"

#define BB_MOB_EQUIP_TARGET "BB_equip_target"

#define BB_NEST_LIST "BB_nestlist"
#define BB_NEST_IGNORE_LIST "BB_nest_ignore"
#define BB_NEST_MATERIAL_LIST "BB_nest_material_list"

///the bee hive we live inside
#define BB_CURRENT_HOME "BB_current_home"
#define BB_HOME_PATH "BB_home_path"
#define BB_WEAPON_TYPE "BB_weapon_type"
#define BB_ARMOR_CLASS "BB_armorclass"

#define BB_RESISTING "BB_resisting"

/// Converts a probability/second chance to probability/seconds_per_tick chance
/// For example, if you want an event to happen with a 10% per second chance, but your proc only runs every 5 seconds, do `if(prob(100*SPT_PROB_RATE(0.1, 5)))`
#define SPT_PROB_RATE(prob_per_second, seconds_per_tick) (1 - (1 - (prob_per_second)) ** (seconds_per_tick))

/// Like SPT_PROB_RATE but easier to use, simply put `if(SPT_PROB(10, 5))`
#define SPT_PROB(prob_per_second_percent, seconds_per_tick) (prob(100*SPT_PROB_RATE((prob_per_second_percent)/100, (seconds_per_tick))))
// )


// Keys used by one and only one behavior
// Used to hold state without making bigass lists
/// For /datum/ai_behavior/find_potential_targets, what if any field are we using currently
#define BB_FIND_TARGETS_FIELD(type) "bb_find_targets_field_[type]"
/// For /datum/ai_behavior/find_potential_horny_targets, what if any field are we using currently
#define BB_FIND_HORNY_TARGETS_FIELD(type) "bb_find_horny_targets_field_[type]"

#define BB_MOB_AGGRO_TABLE "aggro_table" // Associative list of [mob] -> threat_level
#define BB_AGGRO_DECAY_TIMER "aggro_decay_timer"
#define BB_HIGHEST_THREAT_MOB "highest_threat_mob"
#define BB_THREAT_THRESHOLD "threat_threshold" // Minimum threat to be considered hostile
#define BB_AGGRO_RANGE "aggro_range" // Range at which mobs can detect and add threats
#define BB_AGGRO_MAINTAIN_RANGE "aggro_maintain_range" // Range at which target is dropped if exceeded
#define BB_HEALING_SOURCE "healing_source" // Who last healed the mob
#define BB_SNEAKING "bb_sneaking"
#define BB_SNEAK_COOLDOWN "bb_sneak_cooldown"


///sent from ai controllers when they pick behaviors: (list/datum/ai_behavior/old_behaviors, list/datum/ai_behavior/new_behaviors)
#define COMSIG_AI_CONTROLLER_PICKED_BEHAVIORS "ai_controller_picked_behaviors"
///sent from ai controllers when a behavior is inserted into the queue: (list/new_arguments)
#define AI_CONTROLLER_BEHAVIOR_QUEUED(type) "ai_controller_behavior_queued_[type]"
