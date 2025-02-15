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
    (q_14b)
  )
  (:action startaction
    :parameters ()
    :precondition 
      (and
        (startsymb)
        (f_ok)
        (f_world))
    :effect
      (and
        (f_copy)
        (not 
          (startsymb))
        (not 
          (f_world))
      )
    )
  (:action clean_0_a0
    :parameters ()
    :precondition 
      (and
        (not 
          (startsymb))
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
        (not 
          (startsymb))
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
        (not 
          (startsymb))
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
        (not 
          (startsymb))
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
        (not 
          (startsymb))
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
        (not 
          (startsymb))
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
        (not 
          (startsymb))
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
        (not 
          (startsymb))
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
          (q_12s))
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
          (q_15))
        (when
          (q_2s)
          (q_3))
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
          (q_14s))
        (when
          (q_3s)
          (q_4s))
        (q_4t)
        (when
          (and
            (q_1d)
            (q_2d))
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
          (q_15))
        (when
          (q_4s)
          (q_5))
        (q_5t)
        (when
          (and
            (q_1d)
            (q_2d)
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
            (q_2d)
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
          (q_14s))
        (when
          (q_5s)
          (q_5))
        (when
          (q_5s)
          (q_15))
        (q_6t)
        (q_14b)
        (when
          (q_5s)
          (not 
            (q_5s)))
        (not 
          (q_5t))
      )
    )
  (:action o_sync_q_6s_1
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
          (q_8s))
        (q_7t)
        (when
          (and
            (q_1d)
            (q_2d)
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
  (:action o_sync_q_6s_2
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
          (q_7s))
        (q_7t)
        (when
          (and
            (q_1d)
            (q_2d)
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
          (q_11s))
        (when
          (q_7s)
          (q_10s))
        (q_8t)
        (when
          (and
            (q_1d)
            (q_2d)
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
  (:action o_sync_q_8s
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
          (q_13s))
        (when
          (q_8s)
          (q_9s))
        (q_9t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d))
          (q_8d))
        (when
          (q_8s)
          (not 
            (q_8s)))
        (not 
          (q_8t))
      )
    )
  (:action o_sync_q_9s
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
          (q_15))
        (when
          (q_9s)
          (q_11))
        (q_10t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
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
          (q_15))
        (when
          (q_10s)
          (q_13))
        (q_11t)
        (when
          (and
            (q_1d)
            (q_2d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d))
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
        (q_12t)
        (when
          (and
            (q_11s)
            (water)
            (q_1d)
            (q_2d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_9d))
          (q_11d))
        (when
          (q_11s)
          (not 
            (q_11s)))
        (when
          (and
            (q_11s)
            (not 
              (water)))
          (not 
            (f_ok)))
        (not 
          (q_11t))
      )
    )
  (:action o_sync_q_12s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_12t))
    :effect
      (and
        (q_13t)
        (when
          (and
            (q_12s)
            (startsymb)
            (q_1d))
          (q_12d))
        (when
          (q_12s)
          (not 
            (q_12s)))
        (when
          (and
            (q_12s)
            (not 
              (startsymb)))
          (not 
            (f_ok)))
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
        (q_14t)
        (when
          (and
            (q_13s)
            (pluck)
            (q_1d)
            (q_2d)
            (q_3d)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_7d)
            (q_8d)
            (q_10d))
          (q_13d))
        (when
          (q_13s)
          (not 
            (q_13s)))
        (when
          (and
            (q_13s)
            (not 
              (pluck)))
          (not 
            (f_ok)))
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
        (q_15t)
        (when
          (and
            (q_14s)
            (clean)
            (q_1d)
            (q_2d)
            (q_3d)
            (q_4d)
            (q_5d))
          (q_14d))
        (when
          (q_14s)
          (not 
            (q_14s)))
        (when
          (and
            (q_14s)
            (not 
              (clean)))
          (not 
            (f_ok)))
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
          (q_15s)
          (not 
            (q_15s)))
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
          (q_16s)
          (not 
            (f_ok)))
        (not 
          (q_16t))
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
      )
    )
)