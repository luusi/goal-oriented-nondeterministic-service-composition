(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s1_handler_film_deposition_0 - state
    s2_handler_resist_coating_0 - state
    s3_handler_exposure_0 - state
    s4_handler_development_0 - state
    s5_handler_etching_0 - state
    s6_handler_impurities_implantation_0 - state
    s7_handler_activation_0 - state
    s8_handler_resist_stripping_0 - state
    s9_handler_assembly_0 - state
    s10_handler_testing_0 - state
    s11_handler_packaging_0 - state
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
    (current_state_10 ?s - state)
    (current_state_11 ?s - state)
    (activation)
    (assembly)
    (cleaning)
    (development)
    (etching)
    (exposure)
    (film_deposition)
    (impurities_implantation)
    (packaging)
    (resist_coating)
    (resist_stripping)
    (testing)
    (startsymb)
  )
(:action activation_7_handler_activation_0
    :precondition (current_state_7 s7_handler_activation_0)
    :effect (and
            (current_state_7 s7_handler_activation_0)
        (activation)
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action assembly_9_handler_assembly_0
    :precondition (current_state_9 s9_handler_assembly_0)
    :effect (and
            (current_state_9 s9_handler_assembly_0)
        (assembly)
        (not (activation))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action cleaning_0_handler_cleaning_0
    :precondition (current_state_0 s0_handler_cleaning_0)
    :effect (and
            (current_state_0 s0_handler_cleaning_0)
        (cleaning)
        (not (activation))
        (not (assembly))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action development_4_handler_development_0
    :precondition (current_state_4 s4_handler_development_0)
    :effect (and
            (current_state_4 s4_handler_development_0)
        (development)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action etching_5_handler_etching_0
    :precondition (current_state_5 s5_handler_etching_0)
    :effect (and
            (current_state_5 s5_handler_etching_0)
        (etching)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action exposure_3_handler_exposure_0
    :precondition (current_state_3 s3_handler_exposure_0)
    :effect (and
            (current_state_3 s3_handler_exposure_0)
        (exposure)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action film_deposition_1_handler_film_deposition_0
    :precondition (current_state_1 s1_handler_film_deposition_0)
    :effect (and
            (current_state_1 s1_handler_film_deposition_0)
        (film_deposition)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action impurities_implantation_6_handler_impurities_implantation_0
    :precondition (current_state_6 s6_handler_impurities_implantation_0)
    :effect (and
            (current_state_6 s6_handler_impurities_implantation_0)
        (impurities_implantation)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action packaging_11_handler_packaging_0
    :precondition (current_state_11 s11_handler_packaging_0)
    :effect (and
            (current_state_11 s11_handler_packaging_0)
        (packaging)
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
        (not (testing))
    )
)
(:action resist_coating_2_handler_resist_coating_0
    :precondition (current_state_2 s2_handler_resist_coating_0)
    :effect (and
            (current_state_2 s2_handler_resist_coating_0)
        (resist_coating)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_stripping))
        (not (testing))
    )
)
(:action resist_stripping_8_handler_resist_stripping_0
    :precondition (current_state_8 s8_handler_resist_stripping_0)
    :effect (and
            (current_state_8 s8_handler_resist_stripping_0)
        (resist_stripping)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (testing))
    )
)
(:action testing_10_handler_testing_0
    :precondition (current_state_10 s10_handler_testing_0)
    :effect (and
            (current_state_10 s10_handler_testing_0)
        (testing)
        (not (activation))
        (not (assembly))
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (impurities_implantation))
        (not (packaging))
        (not (resist_coating))
        (not (resist_stripping))
    )
)
  )
