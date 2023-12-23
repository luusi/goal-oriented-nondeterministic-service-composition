(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_handler_cleaning_0)
    (current_state_1 s1_handler_film_deposition_0)
    (current_state_2 s2_handler_resist_coating_0)
    (current_state_3 s3_handler_exposure_0)
    (current_state_4 s4_handler_development_0)
    (current_state_5 s5_handler_etching_0)
    (current_state_6 s6_handler_impurities_implantation_0)
    (current_state_7 s7_handler_activation_0)
    (current_state_8 s8_handler_resist_stripping_0)
    (current_state_9 s9_handler_assembly_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next (eventually (and cleaning (not film_deposition) (not resist_coating) (not exposure) (not development) (not etching) (not impurities_implantation) (not activation) (not resist_stripping) (not assembly) (eventually (and film_deposition (not cleaning) (not resist_coating) (not exposure) (not development) (not etching) (not impurities_implantation) (not activation) (not resist_stripping) (not assembly) (eventually (and resist_coating (not cleaning) (not film_deposition) (not exposure) (not development) (not etching) (not impurities_implantation) (not activation) (not resist_stripping) (not assembly) (eventually (and exposure (not cleaning) (not film_deposition) (not resist_coating) (not development) (not etching) (not impurities_implantation) (not activation) (not resist_stripping) (not assembly) (eventually (and development (not cleaning) (not film_deposition) (not resist_coating) (not exposure) (not etching) (not impurities_implantation) (not activation) (not resist_stripping) (not assembly) (eventually (and etching (not cleaning) (not film_deposition) (not resist_coating) (not exposure) (not development) (not impurities_implantation) (not activation) (not resist_stripping) (not assembly) (eventually (and impurities_implantation (not cleaning) (not film_deposition) (not resist_coating) (not exposure) (not development) (not etching) (not activation) (not resist_stripping) (not assembly) (eventually (and activation (not cleaning) (not film_deposition) (not resist_coating) (not exposure) (not development) (not etching) (not impurities_implantation) (not resist_stripping) (not assembly) (eventually (and resist_stripping (not cleaning) (not film_deposition) (not resist_coating) (not exposure) (not development) (not etching) (not impurities_implantation) (not activation) (not assembly) (eventually (and assembly (not cleaning) (not film_deposition) (not resist_coating) (not exposure) (not development) (not etching) (not impurities_implantation) (not activation) (not resist_stripping)))))))))))))))))))))))
            )
    )
)
