(define (domain composition)
  (:requirements :strips :typing  :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
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
            (current_state_0 s0_handler_cleaning_0)
        (cleaning)
    )
)
  )
