(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_handler_cleaning_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (not (next (not (eventually cleaning)))))
            )
    )
)
