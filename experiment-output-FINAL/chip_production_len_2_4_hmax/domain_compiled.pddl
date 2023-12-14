(define (domain 'domain-problem')
  (:types
    state - NO_TYPE
    action - NO_TYPE
  )

  (:predicates
    (current_state_0 ?x0 - state)
    (current_state_1 ?x0 - state)
    (cleaning)
    (film_deposition)
    (startsymb)
    (f_copy)
    (f_sync)
    (f_world)
    (f_ok)
    (q_1)
    (q_1s)
    (q_1t)
    (q_1d)
    (q_2)
    (q_2s)
    (q_2t)
    (q_2d)
    (q_3)
    (q_3s)
    (q_3t)
    (q_3d)
    (q_4)
    (q_4s)
    (q_4t)
    (q_4d)
    (q_5)
    (q_5s)
    (q_5t)
    (q_5d)
    (q_6)
    (q_6s)
    (q_6t)
    (q_6d)
    (q_7)
    (q_7s)
    (q_7t)
    (q_7d)
    (q_8)
    (q_8s)
    (q_8t)
    (q_8d)
    (q_9)
    (q_9s)
    (q_9t)
    (q_9d)
    (q_10)
    (q_10s)
    (q_10t)
    (q_10d)
    (q_11)
    (q_11s)
    (q_11t)
    (q_11d)
    (q_12)
    (q_12s)
    (q_12t)
    (q_12d)
    (q_13)
    (q_13s)
    (q_13t)
    (q_13d)
    (q_14)
    (q_14s)
    (q_14t)
    (q_14d)
    (q_15)
    (q_15s)
    (q_15t)
    (q_15d)
    (q_16)
    (q_16s)
    (q_16t)
    (q_16d)
    (q_17)
    (q_17s)
    (q_17t)
    (q_17d)
    (q_18)
    (q_18s)
    (q_18t)
    (q_18d)
    (q_19)
    (q_19s)
    (q_19t)
    (q_19d)
    (q_20)
    (q_20s)
    (q_20t)
    (q_20d)
    (q_21)
    (q_21s)
    (q_21t)
    (q_21d)
    (q_22)
    (q_22s)
    (q_22t)
    (q_22d)
    (q_23)
    (q_23s)
    (q_23t)
    (q_23d)
    (q_24)
    (q_24s)
    (q_24t)
    (q_24d)
    (q_25)
    (q_25s)
    (q_25t)
    (q_25d)
    (q_26)
    (q_26s)
    (q_26t)
    (q_26d)
  )
  (:action cleaning_0_handler_cleaning_0
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_handler_cleaning_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_0 s0_handler_cleaning_0)
        (cleaning)
        (f_copy)
        (not 
          (film_deposition))
        (not 
          (f_world))
      )
    )
  (:action film_deposition_1_handler_film_deposition_0
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_handler_film_deposition_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_1 s1_handler_film_deposition_0)
        (film_deposition)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (f_world))
      )
    )
  (:action o_copy
    :parameters ()
    :precondition 
      (and
        (f_ok)
        (f_copy))
    :effect
      (and
        (f_sync)
        (q_1t)
        (when
          (q_1)
          (q_1s))
        (when
          (q_2)
          (q_2s))
        (when
          (q_3)
          (q_3s))
        (when
          (q_4)
          (q_4s))
        (when
          (q_5)
          (q_5s))
        (when
          (q_6)
          (q_6s))
        (when
          (q_7)
          (q_7s))
        (when
          (q_8)
          (q_8s))
        (when
          (q_9)
          (q_9s))
        (when
          (q_10)
          (q_10s))
        (when
          (q_11)
          (q_11s))
        (when
          (q_12)
          (q_12s))
        (when
          (q_13)
          (q_13s))
        (when
          (q_14)
          (q_14s))
        (when
          (q_15)
          (q_15s))
        (when
          (q_16)
          (q_16s))
        (when
          (q_17)
          (q_17s))
        (when
          (q_18)
          (q_18s))
        (when
          (q_19)
          (q_19s))
        (when
          (q_20)
          (q_20s))
        (when
          (q_21)
          (q_21s))
        (when
          (q_22)
          (q_22s))
        (when
          (q_23)
          (q_23s))
        (when
          (q_24)
          (q_24s))
        (when
          (q_25)
          (q_25s))
        (when
          (q_26)
          (q_26s))
        (not 
          (f_copy))
        (not 
          (q_1))
        (not 
          (q_2))
        (not 
          (q_3))
        (not 
          (q_4))
        (not 
          (q_5))
        (not 
          (q_6))
        (not 
          (q_7))
        (not 
          (q_8))
        (not 
          (q_9))
        (not 
          (q_10))
        (not 
          (q_11))
        (not 
          (q_12))
        (not 
          (q_13))
        (not 
          (q_14))
        (not 
          (q_15))
        (not 
          (q_16))
        (not 
          (q_17))
        (not 
          (q_18))
        (not 
          (q_19))
        (not 
          (q_20))
        (not 
          (q_21))
        (not 
          (q_22))
        (not 
          (q_23))
        (not 
          (q_24))
        (not 
          (q_25))
        (not 
          (q_26))
      )
    )
  (:action o_sync_q_1s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_1t))
    :effect
      (and
        (when
          (q_1s)
          (q_3s))
        (when
          (q_1s)
          (q_2s))
        (q_2t)
        (q_1d)
        (when
          (q_1s)
          (not 
            (q_1s)))
        (not 
          (q_1t))
      )
    )
  (:action o_sync_q_2s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_2t))
    :effect
      (and
        (when
          (q_2s)
          (q_9s))
        (when
          (q_2s)
          (q_8s))
        (q_3t)
        (when
          (q_1d)
          (q_2d))
        (when
          (q_2s)
          (not 
            (q_2s)))
        (not 
          (q_2t))
      )
    )
  (:action o_sync_q_3s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_3t))
    :effect
      (and
        (when
          (q_3s)
          (q_20s))
        (when
          (q_3s)
          (q_4s))
        (q_4t)
        (when
          (q_1d)
          (q_3d))
        (when
          (q_3s)
          (not 
            (q_3s)))
        (not 
          (q_3t))
      )
    )
  (:action o_sync_q_4s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_4t))
    :effect
      (and
        (when
          (q_4s)
          (q_25))
        (when
          (q_4s)
          (q_5))
        (q_5t)
        (when
          (and
            (q_1d)
            (q_3d))
          (q_4d))
        (when
          (q_4s)
          (not 
            (q_4s)))
        (not 
          (q_4t))
      )
    )
  (:action o_sync_q_5s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_5t))
    :effect
      (and
        (when
          (q_5s)
          (q_6s))
        (q_6t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_4d))
          (q_5d))
        (when
          (q_5s)
          (not 
            (q_5s)))
        (not 
          (q_5t))
      )
    )
  (:action o_sync_q_5s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_5t))
    :effect
      (and
        (when
          (q_5s)
          (q_25))
        (when
          (q_5s)
          (q_5))
        (q_6t)
        (when
          (q_5s)
          (not 
            (q_5s)))
        (not 
          (q_5t))
      )
    )
  (:action o_sync_q_6s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_6t))
    :effect
      (and
        (when
          (q_6s)
          (q_24s))
        (when
          (q_6s)
          (q_7s))
        (q_7t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d))
          (q_6d))
        (when
          (q_6s)
          (not 
            (q_6s)))
        (not 
          (q_6t))
      )
    )
  (:action o_sync_q_7s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_7t))
    :effect
      (and
        (when
          (q_7s)
          (q_12s))
        (when
          (q_7s)
          (q_15s))
        (q_8t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d))
          (q_7d))
        (when
          (q_7s)
          (not 
            (q_7s)))
        (not 
          (q_7t))
      )
    )
  (:action o_sync_q_8s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_8t))
    :effect
      (and
        (when
          (q_8s)
          (q_10s))
        (q_9t)
        (when
          (and
            (q_1d)
            (q_2d))
          (q_8d))
        (when
          (q_8s)
          (not 
            (q_8s)))
        (not 
          (q_8t))
      )
    )
  (:action o_sync_q_8s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_8t))
    :effect
      (and
        (when
          (q_8s)
          (q_25))
        (when
          (q_8s)
          (q_8))
        (q_9t)
        (when
          (q_8s)
          (not 
            (q_8s)))
        (not 
          (q_8t))
      )
    )
  (:action o_sync_q_9s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9t))
    :effect
      (and
        (when
          (q_9s)
          (q_11s))
        (q_10t)
        (when
          (and
            (q_1d)
            (q_2d))
          (q_9d))
        (when
          (q_9s)
          (not 
            (q_9s)))
        (not 
          (q_9t))
      )
    )
  (:action o_sync_q_9s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9t))
    :effect
      (and
        (when
          (q_9s)
          (q_25))
        (when
          (q_9s)
          (q_9))
        (q_10t)
        (when
          (q_9s)
          (not 
            (q_9s)))
        (not 
          (q_9t))
      )
    )
  (:action o_sync_q_10s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_10t))
    :effect
      (and
        (when
          (q_10s)
          (q_18s))
        (when
          (q_10s)
          (q_13s))
        (q_11t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_8d))
          (q_10d))
        (when
          (q_10s)
          (not 
            (q_10s)))
        (not 
          (q_10t))
      )
    )
  (:action o_sync_q_11s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_11t))
    :effect
      (and
        (when
          (q_11s)
          (q_19s))
        (when
          (q_11s)
          (q_13s))
        (q_12t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_9d))
          (q_11d))
        (when
          (q_11s)
          (not 
            (q_11s)))
        (not 
          (q_11t))
      )
    )
  (:action o_sync_q_12s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_12t))
    :effect
      (and
        (when
          (q_12s)
          (q_14s))
        (q_13t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d))
          (q_12d))
        (when
          (q_12s)
          (not 
            (q_12s)))
        (not 
          (q_12t))
      )
    )
  (:action o_sync_q_12s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_12t))
    :effect
      (and
        (when
          (q_12s)
          (q_25))
        (when
          (q_12s)
          (q_12))
        (q_13t)
        (when
          (q_12s)
          (not 
            (q_12s)))
        (not 
          (q_12t))
      )
    )
  (:action o_sync_q_13s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_13t))
    :effect
      (and
        (when
          (q_13s)
          (q_21s))
        (q_14t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_8d)
            (q_9d)
            (q_10d)
            (q_11d))
          (q_13d))
        (when
          (q_13s)
          (not 
            (q_13s)))
        (not 
          (q_13t))
      )
    )
  (:action o_sync_q_13s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_13t))
    :effect
      (and
        (when
          (q_13s)
          (q_17s))
        (q_14t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_8d)
            (q_9d)
            (q_10d)
            (q_11d))
          (q_13d))
        (when
          (q_13s)
          (not 
            (q_13s)))
        (not 
          (q_13t))
      )
    )
  (:action o_sync_q_14s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_14t))
    :effect
      (and
        (when
          (q_14s)
          (q_22s))
        (when
          (q_14s)
          (q_16s))
        (q_15t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_12d))
          (q_14d))
        (when
          (q_14s)
          (not 
            (q_14s)))
        (not 
          (q_14t))
      )
    )
  (:action o_sync_q_15s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_15t))
    :effect
      (and
        (q_16t)
        (when
          (and
            (q_15s)
            (not 
              (film_deposition))
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d))
          (q_15d))
        (when
          (q_15s)
          (not 
            (q_15s)))
        (when
          (and
            (q_15s)
            (film_deposition))
          (not 
            (f_ok)))
        (not 
          (q_15t))
      )
    )
  (:action o_sync_q_16s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_16t))
    :effect
      (and
        (q_17t)
        (when
          (and
            (q_16s)
            (not 
              (cleaning))
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_12d)
            (q_14d))
          (q_16d))
        (when
          (q_16s)
          (not 
            (q_16s)))
        (when
          (and
            (q_16s)
            (cleaning))
          (not 
            (f_ok)))
        (not 
          (q_16t))
      )
    )
  (:action o_sync_q_17s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_17t))
    :effect
      (and
        (when
          (q_17s)
          (q_25))
        (when
          (q_17s)
          (q_23))
        (q_18t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_8d)
            (q_9d)
            (q_10d)
            (q_11d)
            (q_13d))
          (q_17d))
        (when
          (q_17s)
          (not 
            (q_17s)))
        (not 
          (q_17t))
      )
    )
  (:action o_sync_q_18s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_18t))
    :effect
      (and
        (q_19t)
        (when
          (and
            (q_18s)
            (current_state_1 s1_handler_film_deposition_0)
            (q_1d)
            (q_2d)
            (q_8d)
            (q_10d))
          (q_18d))
        (when
          (q_18s)
          (not 
            (q_18s)))
        (when
          (and
            (q_18s)
            (not 
              (current_state_1 s1_handler_film_deposition_0)))
          (not 
            (f_ok)))
        (not 
          (q_18t))
      )
    )
  (:action o_sync_q_19s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_19t))
    :effect
      (and
        (q_20t)
        (when
          (and
            (q_19s)
            (current_state_0 s0_handler_cleaning_0)
            (q_1d)
            (q_2d)
            (q_9d)
            (q_11d))
          (q_19d))
        (when
          (q_19s)
          (not 
            (q_19s)))
        (when
          (and
            (q_19s)
            (not 
              (current_state_0 s0_handler_cleaning_0)))
          (not 
            (f_ok)))
        (not 
          (q_19t))
      )
    )
  (:action o_sync_q_20s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_20t))
    :effect
      (and
        (q_21t)
        (when
          (and
            (q_20s)
            (startsymb)
            (q_1d)
            (q_3d))
          (q_20d))
        (when
          (q_20s)
          (not 
            (q_20s)))
        (when
          (and
            (q_20s)
            (not 
              (startsymb)))
          (not 
            (f_ok)))
        (not 
          (q_20t))
      )
    )
  (:action o_sync_q_21s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_21t))
    :effect
      (and
        (when
          (q_21s)
          (q_26))
        (q_22t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_8d)
            (q_9d)
            (q_10d)
            (q_11d)
            (q_13d))
          (q_21d))
        (when
          (q_21s)
          (not 
            (q_21s)))
        (not 
          (q_21t))
      )
    )
  (:action o_sync_q_22s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_22t))
    :effect
      (and
        (q_23t)
        (when
          (and
            (q_22s)
            (film_deposition)
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_12d)
            (q_14d))
          (q_22d))
        (when
          (q_22s)
          (not 
            (q_22s)))
        (when
          (and
            (q_22s)
            (not 
              (film_deposition)))
          (not 
            (f_ok)))
        (not 
          (q_22t))
      )
    )
  (:action o_sync_q_23s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_23t))
    :effect
      (and
        (q_24t)
        (when
          (q_23s)
          (not 
            (q_23s)))
        (when
          (q_23s)
          (not 
            (f_ok)))
        (not 
          (q_23t))
      )
    )
  (:action o_sync_q_24s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_24t))
    :effect
      (and
        (q_25t)
        (when
          (and
            (q_24s)
            (cleaning)
            (q_1d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d))
          (q_24d))
        (when
          (q_24s)
          (not 
            (q_24s)))
        (when
          (and
            (q_24s)
            (not 
              (cleaning)))
          (not 
            (f_ok)))
        (not 
          (q_24t))
      )
    )
  (:action o_sync_q_25s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_25t))
    :effect
      (and
        (q_26t)
        (when
          (q_25s)
          (not 
            (q_25s)))
        (not 
          (q_25t))
      )
    )
  (:action o_sync_q_26s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_26t))
    :effect
      (and
        (f_world)
        (when
          (q_1s)
          (q_1))
        (when
          (q_2s)
          (q_2))
        (when
          (q_3s)
          (q_3))
        (when
          (q_4s)
          (q_4))
        (when
          (q_5s)
          (q_5))
        (when
          (q_6s)
          (q_6))
        (when
          (q_7s)
          (q_7))
        (when
          (q_8s)
          (q_8))
        (when
          (q_9s)
          (q_9))
        (when
          (q_10s)
          (q_10))
        (when
          (q_11s)
          (q_11))
        (when
          (q_12s)
          (q_12))
        (when
          (q_13s)
          (q_13))
        (when
          (q_14s)
          (q_14))
        (when
          (q_15s)
          (q_15))
        (when
          (q_16s)
          (q_16))
        (when
          (q_17s)
          (q_17))
        (when
          (q_18s)
          (q_18))
        (when
          (q_19s)
          (q_19))
        (when
          (q_20s)
          (q_20))
        (when
          (q_21s)
          (q_21))
        (when
          (q_22s)
          (q_22))
        (when
          (q_23s)
          (q_23))
        (when
          (q_24s)
          (q_24))
        (when
          (q_25s)
          (q_25))
        (when
          (q_26s)
          (q_26))
        (when
          (q_26s)
          (not 
            (f_ok)))
        (not 
          (q_26t))
        (not 
          (f_sync))
        (not 
          (q_1s))
        (not 
          (q_2s))
        (not 
          (q_3s))
        (not 
          (q_4s))
        (not 
          (q_5s))
        (not 
          (q_6s))
        (not 
          (q_7s))
        (not 
          (q_8s))
        (not 
          (q_9s))
        (not 
          (q_10s))
        (not 
          (q_11s))
        (not 
          (q_12s))
        (not 
          (q_13s))
        (not 
          (q_14s))
        (not 
          (q_15s))
        (not 
          (q_16s))
        (not 
          (q_17s))
        (not 
          (q_18s))
        (not 
          (q_19s))
        (not 
          (q_20s))
        (not 
          (q_21s))
        (not 
          (q_22s))
        (not 
          (q_23s))
        (not 
          (q_24s))
        (not 
          (q_25s))
        (not 
          (q_26s))
      )
    )
)