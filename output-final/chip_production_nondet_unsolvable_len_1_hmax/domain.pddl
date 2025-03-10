(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s0_handler_cleaning_broken - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (cleaning)
    (startsymb)
  )
(:action startaction
    :precondition (startsymb)
    :effect (not (startsymb))
)
(:action cleaning_0_handler_cleaning_0
    :precondition (and (not (startsymb)) (current_state_0 s0_handler_cleaning_0))
    :effect (and
        (oneof
            (current_state_0 s0_handler_cleaning_0)
            (and (not (current_state_0 s0_handler_cleaning_0)) (current_state_0 s0_handler_cleaning_broken))
         )
        (cleaning)
    )
)
  )
