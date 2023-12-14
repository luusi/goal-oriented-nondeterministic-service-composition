(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_a0 - state s0_a1 - state s1_b0 - state s1_b1 - state s1_b2 - state s2_c0 - state s2_c1 - state)
  (:init 
    (current_state_0 s0_a0)
    (current_state_1 s1_b0)
    (current_state_2 s2_c0)
    (startsymb)
    (q_1)
    (f_copy)
    (f_ok)
  )
  (:goal (and
    (not 
      (q_31))
    (q_1d)
    (q_3d)
    (q_26d)
    (q_5d)
    (q_6d)
    (q_30d)
    (q_7d)
    (q_8d)
    (q_9d)
    (or
      (and
        (q_18d)
        (q_27d)
        (q_19d)
        (q_25d))
      (and
        (q_17d)
        (q_25d)
        (q_20d)
        (q_27d)))
    (q_2d)
    (q_12d)
    (q_15d)
    (q_24d)
    (q_16d)
    (or
      (q_28d)
      (and
        (q_21d)
        (q_29d)))
    (q_4d)
    (q_11d)
    (q_14d)
    (q_23d)
    (q_16d)
    (or
      (q_28d)
      (and
        (q_21d)
        (q_29d)))
    (q_10d)
    (q_13d)
    (q_22d)
    (q_16d)
    (or
      (q_28d)
      (and
        (q_21d)
        (q_29d)))))

)