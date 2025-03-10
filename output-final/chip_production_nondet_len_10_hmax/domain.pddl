(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s0_handler_cleaning_broken - state
    s1_handler_film_deposition_0 - state
    s1_handler_film_deposition_broken - state
    s2_handler_resist_coating_0 - state
    s2_handler_resist_coating_broken - state
    s3_handler_exposure_0 - state
    s3_handler_exposure_broken - state
    s4_handler_development_0 - state
    s4_handler_development_broken - state
    s5_handler_etching_0 - state
    s5_handler_etching_broken - state
    s6_handler_impurities_implantation_0 - state
    s6_handler_impurities_implantation_broken - state
    s7_handler_activation_0 - state
    s7_handler_activation_broken - state
    s8_handler_resist_stripping_0 - state
    s8_handler_resist_stripping_broken - state
    s9_handler_assembly_0 - state
    s9_handler_assembly_broken - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (current_state_3 ?s - state)
    (current_state_4 ?s - state)
    (current_state_5 ?s - state)
    (current_state_6 ?s - state)
    (current_state_7 ?s - state)
    (current_state_8 ?s - state)
    (current_state_9 ?s - state)
    (activation)
    (assembly)
    (cleaning)
    (development)
    (etching)
    (exposure)
    (film_deposition)
    (impurities_implantation)
    (repair)
    (resist_coating)
    (resist_stripping)
    (startsymb)
  )
(:action startaction
    :precondition (startsymb)
    :effect (not (startsymb))
)
(:action activation_7_handler_activation_0
    :precondition (and (not (startsymb)) (current_state_7 s7_handler_activation_0))
    :effect (and
        (oneof
            (current_state_7 s7_handler_activation_0)
            (and (not (current_state_7 s7_handler_activation_0)) (current_state_7 s7_handler_activation_broken))
         )
        (activation)
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action assembly_9_handler_assembly_0
    :precondition (and (not (startsymb)) (current_state_9 s9_handler_assembly_0))
    :effect (and
        (oneof
            (current_state_9 s9_handler_assembly_0)
            (and (not (current_state_9 s9_handler_assembly_0)) (current_state_9 s9_handler_assembly_broken))
         )
        (assembly)
        (not (activation))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action cleaning_0_handler_cleaning_0
    :precondition (and (not (startsymb)) (current_state_0 s0_handler_cleaning_0))
    :effect (and
        (oneof
            (current_state_0 s0_handler_cleaning_0)
            (and (not (current_state_0 s0_handler_cleaning_0)) (current_state_0 s0_handler_cleaning_broken))
         )
        (cleaning)
        (not (activation))
        (not (assembly))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action development_4_handler_development_0
    :precondition (and (not (startsymb)) (current_state_4 s4_handler_development_0))
    :effect (and
        (oneof
            (current_state_4 s4_handler_development_0)
            (and (not (current_state_4 s4_handler_development_0)) (current_state_4 s4_handler_development_broken))
         )
        (development)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action etching_5_handler_etching_0
    :precondition (and (not (startsymb)) (current_state_5 s5_handler_etching_0))
    :effect (and
        (oneof
            (current_state_5 s5_handler_etching_0)
            (and (not (current_state_5 s5_handler_etching_0)) (current_state_5 s5_handler_etching_broken))
         )
        (etching)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action exposure_3_handler_exposure_0
    :precondition (and (not (startsymb)) (current_state_3 s3_handler_exposure_0))
    :effect (and
        (oneof
            (current_state_3 s3_handler_exposure_0)
            (and (not (current_state_3 s3_handler_exposure_0)) (current_state_3 s3_handler_exposure_broken))
         )
        (exposure)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action film_deposition_1_handler_film_deposition_0
    :precondition (and (not (startsymb)) (current_state_1 s1_handler_film_deposition_0))
    :effect (and
        (oneof
            (current_state_1 s1_handler_film_deposition_0)
            (and (not (current_state_1 s1_handler_film_deposition_0)) (current_state_1 s1_handler_film_deposition_broken))
         )
        (film_deposition)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action impurities_implantation_6_handler_impurities_implantation_0
    :precondition (and (not (startsymb)) (current_state_6 s6_handler_impurities_implantation_0))
    :effect (and
        (oneof
            (current_state_6 s6_handler_impurities_implantation_0)
            (and (not (current_state_6 s6_handler_impurities_implantation_0)) (current_state_6 s6_handler_impurities_implantation_broken))
         )
        (impurities_implantation)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (repair))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_0_handler_cleaning_broken
    :precondition (and (not (startsymb)) (current_state_0 s0_handler_cleaning_broken))
    :effect (and
            (and (not (current_state_0 s0_handler_cleaning_broken)) (current_state_0 s0_handler_cleaning_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_1_handler_film_deposition_broken
    :precondition (and (not (startsymb)) (current_state_1 s1_handler_film_deposition_broken))
    :effect (and
            (and (not (current_state_1 s1_handler_film_deposition_broken)) (current_state_1 s1_handler_film_deposition_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_2_handler_resist_coating_broken
    :precondition (and (not (startsymb)) (current_state_2 s2_handler_resist_coating_broken))
    :effect (and
            (and (not (current_state_2 s2_handler_resist_coating_broken)) (current_state_2 s2_handler_resist_coating_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_3_handler_exposure_broken
    :precondition (and (not (startsymb)) (current_state_3 s3_handler_exposure_broken))
    :effect (and
            (and (not (current_state_3 s3_handler_exposure_broken)) (current_state_3 s3_handler_exposure_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_4_handler_development_broken
    :precondition (and (not (startsymb)) (current_state_4 s4_handler_development_broken))
    :effect (and
            (and (not (current_state_4 s4_handler_development_broken)) (current_state_4 s4_handler_development_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_5_handler_etching_broken
    :precondition (and (not (startsymb)) (current_state_5 s5_handler_etching_broken))
    :effect (and
            (and (not (current_state_5 s5_handler_etching_broken)) (current_state_5 s5_handler_etching_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_6_handler_impurities_implantation_broken
    :precondition (and (not (startsymb)) (current_state_6 s6_handler_impurities_implantation_broken))
    :effect (and
            (and (not (current_state_6 s6_handler_impurities_implantation_broken)) (current_state_6 s6_handler_impurities_implantation_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_7_handler_activation_broken
    :precondition (and (not (startsymb)) (current_state_7 s7_handler_activation_broken))
    :effect (and
            (and (not (current_state_7 s7_handler_activation_broken)) (current_state_7 s7_handler_activation_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_8_handler_resist_stripping_broken
    :precondition (and (not (startsymb)) (current_state_8 s8_handler_resist_stripping_broken))
    :effect (and
            (and (not (current_state_8 s8_handler_resist_stripping_broken)) (current_state_8 s8_handler_resist_stripping_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action repair_9_handler_assembly_broken
    :precondition (and (not (startsymb)) (current_state_9 s9_handler_assembly_broken))
    :effect (and
            (and (not (current_state_9 s9_handler_assembly_broken)) (current_state_9 s9_handler_assembly_0))
        (repair)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
(:action resist_coating_2_handler_resist_coating_0
    :precondition (and (not (startsymb)) (current_state_2 s2_handler_resist_coating_0))
    :effect (and
        (oneof
            (current_state_2 s2_handler_resist_coating_0)
            (and (not (current_state_2 s2_handler_resist_coating_0)) (current_state_2 s2_handler_resist_coating_broken))
         )
        (resist_coating)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_stripping))
    )
)
(:action resist_stripping_8_handler_resist_stripping_0
    :precondition (and (not (startsymb)) (current_state_8 s8_handler_resist_stripping_0))
    :effect (and
        (oneof
            (current_state_8 s8_handler_resist_stripping_0)
            (and (not (current_state_8 s8_handler_resist_stripping_0)) (current_state_8 s8_handler_resist_stripping_broken))
         )
        (resist_stripping)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (repair))
        (not (resist_coating))
    )
)
  )
