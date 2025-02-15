(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_handler_cleaning_0)
    (current_state_1 s1_handler_film_deposition_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (not (next (not (eventually (and cleaning (not film_deposition) (eventually (and film_deposition (not cleaning)))))))))
            )
    )
)
