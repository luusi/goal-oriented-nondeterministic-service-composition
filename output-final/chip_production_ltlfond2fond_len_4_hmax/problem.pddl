(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_handler_cleaning_0)
    (current_state_1 s1_handler_film_deposition_0)
    (current_state_2 s2_handler_resist_coating_0)
    (current_state_3 s3_handler_exposure_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (not (next (not (eventually (and cleaning (not film_deposition) (not resist_coating) (not exposure) (eventually (and film_deposition (not cleaning) (not resist_coating) (not exposure) (eventually (and resist_coating (not cleaning) (not film_deposition) (not exposure) (eventually (and exposure (not cleaning) (not film_deposition) (not resist_coating)))))))))))))
            )
    )
)
