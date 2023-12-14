(define (domain 'domain-problem')
  (:types
    state - NO_TYPE
    action - NO_TYPE
  )

  (:predicates
    (current_state_0 ?x0 - state)
    (current_state_1 ?x0 - state)
    (current_state_2 ?x0 - state)
    (clean)
    (empty)
    (pluck)
    (water)
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
    (q_27)
    (q_27s)
    (q_27t)
    (q_27d)
    (q_28)
    (q_28s)
    (q_28t)
    (q_28d)
    (q_29)
    (q_29s)
    (q_29t)
    (q_29d)
    (q_30)
    (q_30s)
    (q_30t)
    (q_30d)
    (q_31)
    (q_31s)
    (q_31t)
    (q_31d)
    (q_32)
    (q_32s)
    (q_32t)
    (q_32d)
    (q_30b)
  )
  (:action clean_0_a0
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_a0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_0 s0_a0) (and (not (current_state_0 s0_a0)) (current_state_0 s0_a1)))
        (clean)
        (f_copy)
        (not 
          (empty))
        (not 
          (pluck))
        (not 
          (water))
        (not 
          (f_world))
      )
    )
  (:action empty_0_a1
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_a1)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_0 s0_a1))
          (current_state_0 s0_a0))
        (empty)
        (f_copy)
        (not 
          (clean))
        (not 
          (pluck))
        (not 
          (water))
        (not 
          (f_world))
      )
    )
  (:action empty_1_b1
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_b1)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_1 s1_b1))
          (current_state_1 s1_b0))
        (empty)
        (f_copy)
        (not 
          (clean))
        (not 
          (pluck))
        (not 
          (water))
        (not 
          (f_world))
      )
    )
  (:action empty_2_c1
    :parameters ()
    :precondition 
      (and
        (current_state_2 s2_c1)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_2 s2_c1))
          (current_state_2 s2_c0))
        (empty)
        (f_copy)
        (not 
          (clean))
        (not 
          (pluck))
        (not 
          (water))
        (not 
          (f_world))
      )
    )
  (:action pluck_1_b0
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_b0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (and (not (current_state_1 s1_b0)) (current_state_1 s1_b1)) (and (not (current_state_1 s1_b0)) (current_state_1 s1_b2)))
        (pluck)
        (f_copy)
        (not 
          (clean))
        (not 
          (empty))
        (not 
          (water))
        (not 
          (f_world))
      )
    )
  (:action pluck_2_c0
    :parameters ()
    :precondition 
      (and
        (current_state_2 s2_c0)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_2 s2_c0))
          (current_state_2 s2_c1))
        (pluck)
        (f_copy)
        (not 
          (clean))
        (not 
          (empty))
        (not 
          (water))
        (not 
          (f_world))
      )
    )
  (:action water_1_b0
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_b0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_1 s1_b0)
        (water)
        (f_copy)
        (not 
          (clean))
        (not 
          (empty))
        (not 
          (pluck))
        (not 
          (f_world))
      )
    )
  (:action water_1_b1
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_b1)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_1 s1_b1)
        (water)
        (f_copy)
        (not 
          (clean))
        (not 
          (empty))
        (not 
          (pluck))
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
        (when
          (q_27)
          (q_27s))
        (when
          (q_28)
          (q_28s))
        (when
          (q_29)
          (q_29s))
        (when
          (q_30)
          (q_30s))
        (when
          (q_31)
          (q_31s))
        (when
          (q_32)
          (q_32s))
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
        (not 
          (q_27))
        (not 
          (q_28))
        (not 
          (q_29))
        (not 
          (q_30))
        (not 
          (q_31))
        (not 
          (q_32))
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
          (q_12s))
        (when
          (q_2s)
          (q_4s))
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
          (q_26s))
        (when
          (q_3s)
          (q_5s))
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
          (q_11s))
        (when
          (q_4s)
          (q_10s))
        (q_5t)
        (when
          (and
            (q_1d)
            (q_2d))
          (q_4d))
        (when
          (q_4s)
          (not 
            (q_4s)))
        (not 
          (q_4t))
      )
    )
  (:action o_sync_q_5s
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
          (q_31))
        (when
          (q_5s)
          (q_6))
        (q_6t)
        (when
          (and
            (q_1d)
            (q_3d))
          (q_5d))
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
          (q_30s))
        (when
          (q_6s)
          (q_7s))
        (q_7t)
        (when
          (and
            (q_1d)
            (q_3d)
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
          (q_31))
        (when
          (q_7s)
          (q_8))
        (q_8t)
        (when
          (and
            (q_1d)
            (q_3d)
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
          (q_9s))
        (q_9t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d))
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
          (q_30s))
        (when
          (q_8s)
          (q_8))
        (when
          (q_8s)
          (q_31))
        (q_9t)
        (q_30b)
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
          (q_18s))
        (q_10t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d))
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
          (q_17s))
        (q_10t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d))
          (q_9d))
        (when
          (q_9s)
          (not 
            (q_9s)))
        (not 
          (q_9t))
      )
    )
  (:action o_sync_q_10s_1
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
          (q_13s))
        (q_11t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d))
          (q_10d))
        (when
          (q_10s)
          (not 
            (q_10s)))
        (not 
          (q_10t))
      )
    )
  (:action o_sync_q_10s_2
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
          (q_31))
        (when
          (q_10s)
          (q_10))
        (q_11t)
        (when
          (q_10s)
          (not 
            (q_10s)))
        (not 
          (q_10t))
      )
    )
  (:action o_sync_q_11s_1
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
          (q_14s))
        (q_12t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d))
          (q_11d))
        (when
          (q_11s)
          (not 
            (q_11s)))
        (not 
          (q_11t))
      )
    )
  (:action o_sync_q_11s_2
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
          (q_31))
        (when
          (q_11s)
          (q_11))
        (q_12t)
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
          (q_15s))
        (q_13t)
        (when
          (and
            (q_1d)
            (q_2d))
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
          (q_31))
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
  (:action o_sync_q_13s
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
          (q_22s))
        (when
          (q_13s)
          (q_16s))
        (q_14t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d)
            (q_10d))
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
          (q_23s))
        (when
          (q_14s)
          (q_16s))
        (q_15t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d)
            (q_11d))
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
        (when
          (q_15s)
          (q_24s))
        (when
          (q_15s)
          (q_16s))
        (q_16t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_12d))
          (q_15d))
        (when
          (q_15s)
          (not 
            (q_15s)))
        (not 
          (q_15t))
      )
    )
  (:action o_sync_q_16s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_16t))
    :effect
      (and
        (when
          (q_16s)
          (q_28s))
        (q_17t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d)
            (q_10d)
            (q_11d)
            (q_12d)
            (q_13d)
            (q_14d)
            (q_15d))
          (q_16d))
        (when
          (q_16s)
          (not 
            (q_16s)))
        (not 
          (q_16t))
      )
    )
  (:action o_sync_q_16s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_16t))
    :effect
      (and
        (when
          (q_16s)
          (q_21s))
        (q_17t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d)
            (q_10d)
            (q_11d)
            (q_12d)
            (q_13d)
            (q_14d)
            (q_15d))
          (q_16d))
        (when
          (q_16s)
          (not 
            (q_16s)))
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
          (q_25s))
        (when
          (q_17s)
          (q_20s))
        (q_18t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_9d))
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
        (when
          (q_18s)
          (q_27s))
        (when
          (q_18s)
          (q_19s))
        (q_19t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_9d))
          (q_18d))
        (when
          (q_18s)
          (not 
            (q_18s)))
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
        (when
          (q_19s)
          (q_31))
        (when
          (q_19s)
          (q_25))
        (q_20t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_9d)
            (q_18d))
          (q_19d))
        (when
          (q_19s)
          (not 
            (q_19s)))
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
        (when
          (q_20s)
          (q_31))
        (when
          (q_20s)
          (q_27))
        (q_21t)
        (when
          (and
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_9d)
            (q_17d))
          (q_20d))
        (when
          (q_20s)
          (not 
            (q_20s)))
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
          (q_31))
        (when
          (q_21s)
          (q_29))
        (q_22t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d)
            (q_10d)
            (q_11d)
            (q_12d)
            (q_13d)
            (q_14d)
            (q_15d)
            (q_16d))
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
            (current_state_2 s2_c0)
            (q_1d)
            (q_2d)
            (q_4d)
            (q_10d)
            (q_13d))
          (q_22d))
        (when
          (q_22s)
          (not 
            (q_22s)))
        (when
          (and
            (q_22s)
            (not 
              (current_state_2 s2_c0)))
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
          (and
            (q_23s)
            (current_state_1 s1_b0)
            (q_1d)
            (q_2d)
            (q_4d)
            (q_11d)
            (q_14d))
          (q_23d))
        (when
          (q_23s)
          (not 
            (q_23s)))
        (when
          (and
            (q_23s)
            (not 
              (current_state_1 s1_b0)))
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
            (current_state_0 s0_a0)
            (q_1d)
            (q_2d)
            (q_12d)
            (q_15d))
          (q_24d))
        (when
          (q_24s)
          (not 
            (q_24s)))
        (when
          (and
            (q_24s)
            (not 
              (current_state_0 s0_a0)))
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
          (and
            (q_25s)
            (water)
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_9d)
            (q_17d)
            (q_18d)
            (q_19d))
          (q_25d))
        (when
          (q_25s)
          (not 
            (q_25s)))
        (when
          (and
            (q_25s)
            (not 
              (water)))
          (not 
            (f_ok)))
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
        (q_27t)
        (when
          (and
            (q_26s)
            (startsymb)
            (q_1d)
            (q_3d))
          (q_26d))
        (when
          (q_26s)
          (not 
            (q_26s)))
        (when
          (and
            (q_26s)
            (not 
              (startsymb)))
          (not 
            (f_ok)))
        (not 
          (q_26t))
      )
    )
  (:action o_sync_q_27s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_27t))
    :effect
      (and
        (q_28t)
        (when
          (and
            (q_27s)
            (pluck)
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_9d)
            (q_17d)
            (q_18d)
            (q_20d))
          (q_27d))
        (when
          (q_27s)
          (not 
            (q_27s)))
        (when
          (and
            (q_27s)
            (not 
              (pluck)))
          (not 
            (f_ok)))
        (not 
          (q_27t))
      )
    )
  (:action o_sync_q_28s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_28t))
    :effect
      (and
        (when
          (q_28s)
          (q_32))
        (q_29t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_4d)
            (q_10d)
            (q_11d)
            (q_12d)
            (q_13d)
            (q_14d)
            (q_15d)
            (q_16d))
          (q_28d))
        (when
          (q_28s)
          (not 
            (q_28s)))
        (not 
          (q_28t))
      )
    )
  (:action o_sync_q_29s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_29t))
    :effect
      (and
        (q_30t)
        (when
          (q_29s)
          (not 
            (q_29s)))
        (when
          (q_29s)
          (not 
            (f_ok)))
        (not 
          (q_29t))
      )
    )
  (:action o_sync_q_30s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_30t))
    :effect
      (and
        (q_31t)
        (when
          (and
            (q_30s)
            (clean)
            (q_1d)
            (q_3d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d))
          (q_30d))
        (when
          (q_30s)
          (not 
            (q_30s)))
        (when
          (and
            (q_30s)
            (not 
              (clean)))
          (not 
            (f_ok)))
        (not 
          (q_30t))
      )
    )
  (:action o_sync_q_31s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_31t))
    :effect
      (and
        (q_32t)
        (when
          (q_31s)
          (not 
            (q_31s)))
        (not 
          (q_31t))
      )
    )
  (:action o_sync_q_32s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_32t))
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
          (q_27s)
          (q_27))
        (when
          (q_28s)
          (q_28))
        (when
          (q_29s)
          (q_29))
        (when
          (q_30s)
          (q_30))
        (when
          (q_31s)
          (q_31))
        (when
          (q_32s)
          (q_32))
        (when
          (q_32s)
          (not 
            (f_ok)))
        (not 
          (q_32t))
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
        (not 
          (q_27s))
        (not 
          (q_28s))
        (not 
          (q_29s))
        (not 
          (q_30s))
        (not 
          (q_31s))
        (not 
          (q_32s))
      )
    )
)