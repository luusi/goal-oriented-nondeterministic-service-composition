(define (domain 'domain-problem')
  (:types
    state - NO_TYPE
    action - NO_TYPE
  )

  (:predicates
    (current_state_0 ?x0 - state)
    (current_state_1 ?x0 - state)
    (current_state_2 ?x0 - state)
    (current_state_3 ?x0 - state)
    (current_state_4 ?x0 - state)
    (current_state_5 ?x0 - state)
    (assemble_motor)
    (build_inverter)
    (build_rotor)
    (build_stator)
    (electric_test)
    (static_test)
    (startsymb)
    (f_copy)
    (f_sync)
    (f_world)
    (f_ok)
    (f_goal)
    (q_1)
    (q_1s)
    (q_2)
    (q_2s)
    (q_3)
    (q_3s)
    (q_4)
    (q_4s)
    (q_5)
    (q_5s)
    (q_6)
    (q_6s)
    (q_7)
    (q_7s)
    (q_8)
    (q_8s)
    (q_9)
    (q_9s)
    (q_10)
    (q_10s)
    (q_11)
    (q_11s)
    (q_12)
    (q_12s)
    (q_13)
    (q_13s)
    (q_14)
    (q_14s)
    (q_15)
    (q_15s)
    (q_16)
    (q_16s)
    (q_17)
    (q_17s)
    (q_18)
    (q_18s)
    (q_19)
    (q_19s)
    (q_20)
    (q_20s)
    (q_21)
    (q_21s)
    (q_22)
    (q_22s)
    (q_23)
    (q_23s)
    (q_24)
    (q_24s)
    (q_25)
    (q_25s)
    (q_26)
    (q_26s)
    (q_27)
    (q_27s)
    (q_28)
    (q_28s)
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
  (:action assemble_motor_3_motor_assembler_0
    :parameters ()
    :precondition 
      (and
        (not 
          (startsymb))
        (current_state_3 s3_motor_assembler_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_3 s3_motor_assembler_0)
        (assemble_motor)
        (f_copy)
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action build_inverter_2_inverter_builder_0
    :parameters ()
    :precondition 
      (and
        (not 
          (startsymb))
        (current_state_2 s2_inverter_builder_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_2 s2_inverter_builder_0)
        (build_inverter)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action build_rotor_1_stator_builder_0
    :parameters ()
    :precondition 
      (and
        (not 
          (startsymb))
        (current_state_1 s1_stator_builder_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_1 s1_stator_builder_0)
        (build_rotor)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action build_stator_0_rotor_builder_0
    :parameters ()
    :precondition 
      (and
        (not 
          (startsymb))
        (current_state_0 s0_rotor_builder_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_0 s0_rotor_builder_0)
        (build_stator)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action electric_test_4_mechanical_engineer_1_0
    :parameters ()
    :precondition 
      (and
        (not 
          (startsymb))
        (current_state_4 s4_mechanical_engineer_1_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_4 s4_mechanical_engineer_1_0)
        (electric_test)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action static_test_5_mechanical_engineer_2_0
    :parameters ()
    :precondition 
      (and
        (not 
          (startsymb))
        (current_state_5 s5_mechanical_engineer_2_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (current_state_5 s5_mechanical_engineer_2_0)
        (static_test)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
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
      )
    )
  (:action o_goal
    :parameters ()
    :precondition 
      (and
        (f_world)
        (f_ok)
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
          (q_27)))
    :effect
(f_goal)    )
  (:action o_world
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
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
          (q_28s)))
    :effect
      (and
        (f_world)
        (not 
          (f_sync))
      )
    )
  (:action o_sync_q_1s
    :parameters ()
    :precondition 
      (and
        (assemble_motor)
        (f_sync)
        (f_ok)
        (q_1s))
    :effect
(not 
        (q_1s))    )
  (:action o_sync_q_2s
    :parameters ()
    :precondition 
      (and
        (build_inverter)
        (f_sync)
        (f_ok)
        (q_2s))
    :effect
(not 
        (q_2s))    )
  (:action o_sync_q_3s
    :parameters ()
    :precondition 
      (and
        (build_rotor)
        (f_sync)
        (f_ok)
        (q_3s))
    :effect
(not 
        (q_3s))    )
  (:action o_sync_q_4s
    :parameters ()
    :precondition 
      (and
        (build_stator)
        (f_sync)
        (f_ok)
        (q_4s))
    :effect
(not 
        (q_4s))    )
  (:action o_sync_q_5s
    :parameters ()
    :precondition 
      (and
        (electric_test)
        (f_sync)
        (f_ok)
        (q_5s))
    :effect
(not 
        (q_5s))    )
  (:action o_sync_q_6s
    :parameters ()
    :precondition 
      (and
        (startsymb)
        (f_sync)
        (f_ok)
        (q_6s))
    :effect
(not 
        (q_6s))    )
  (:action o_sync_q_7s
    :parameters ()
    :precondition 
      (and
        (static_test)
        (f_sync)
        (f_ok)
        (q_7s))
    :effect
(not 
        (q_7s))    )
  (:action o_sync_q_8s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_8s))
    :effect
      (and
        (q_1s)
        (not 
          (q_8s))
      )
    )
  (:action o_sync_q_8s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_8s))
    :effect
      (and
        (q_27)
        (q_8)
        (not 
          (q_8s))
      )
    )
  (:action o_sync_q_9s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9s))
    :effect
      (and
        (q_21s)
        (not 
          (q_9s))
      )
    )
  (:action o_sync_q_9s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9s))
    :effect
      (and
        (q_27)
        (q_9)
        (not 
          (q_9s))
      )
    )
  (:action o_sync_q_10s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_10s))
    :effect
      (and
        (q_27)
        (q_15)
        (not 
          (q_10s))
      )
    )
  (:action o_sync_q_11s
    :parameters ()
    :precondition 
      (and
        (not 
          (assemble_motor))
        (f_sync)
        (f_ok)
        (q_11s))
    :effect
(not 
        (q_11s))    )
  (:action o_sync_q_12s
    :parameters ()
    :precondition 
      (and
        (not 
          (electric_test))
        (f_sync)
        (f_ok)
        (q_12s))
    :effect
(not 
        (q_12s))    )
  (:action o_sync_q_13s
    :parameters ()
    :precondition 
      (and
        (not 
          (static_test))
        (f_sync)
        (f_ok)
        (q_13s))
    :effect
(not 
        (q_13s))    )
  (:action o_sync_q_14s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_14s))
    :effect
      (and
        (q_6s)
        (q_10s)
        (not 
          (q_14s))
      )
    )
  (:action o_sync_q_15s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_15s))
    :effect
      (and
        (q_8s)
        (q_20s)
        (not 
          (q_15s))
      )
    )
  (:action o_sync_q_16s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_16s))
    :effect
      (and
        (q_9s)
        (q_26s)
        (not 
          (q_16s))
      )
    )
  (:action o_sync_q_17s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_17s))
    :effect
      (and
        (q_16s)
        (q_25s)
        (not 
          (q_17s))
      )
    )
  (:action o_sync_q_18s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_18s))
    :effect
      (and
        (q_17s)
        (q_22s)
        (not 
          (q_18s))
      )
    )
  (:action o_sync_q_19s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_19s))
    :effect
      (and
        (q_18s)
        (q_24s)
        (not 
          (q_19s))
      )
    )
  (:action o_sync_q_20s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_20s))
    :effect
      (and
        (q_19s)
        (q_23s)
        (not 
          (q_20s))
      )
    )
  (:action o_sync_q_21s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_21s))
    :effect
      (and
        (q_5s)
        (not 
          (q_21s))
      )
    )
  (:action o_sync_q_21s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_21s))
    :effect
      (and
        (q_7s)
        (not 
          (q_21s))
      )
    )
  (:action o_sync_q_22s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_22s))
    :effect
      (and
        (q_2s)
        (not 
          (q_22s))
      )
    )
  (:action o_sync_q_22s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_22s))
    :effect
      (and
        (q_11s)
        (q_22)
        (q_27)
        (not 
          (q_22s))
      )
    )
  (:action o_sync_q_23s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_23s))
    :effect
      (and
        (q_3s)
        (not 
          (q_23s))
      )
    )
  (:action o_sync_q_23s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_23s))
    :effect
      (and
        (q_11s)
        (q_23)
        (q_27)
        (not 
          (q_23s))
      )
    )
  (:action o_sync_q_24s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_24s))
    :effect
      (and
        (q_4s)
        (not 
          (q_24s))
      )
    )
  (:action o_sync_q_24s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_24s))
    :effect
      (and
        (q_11s)
        (q_24)
        (q_27)
        (not 
          (q_24s))
      )
    )
  (:action o_sync_q_25s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_25s))
    :effect
      (and
        (q_1s)
        (not 
          (q_25s))
      )
    )
  (:action o_sync_q_25s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_25s))
    :effect
      (and
        (q_12s)
        (q_25)
        (q_27)
        (not 
          (q_25s))
      )
    )
  (:action o_sync_q_26s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_26s))
    :effect
      (and
        (q_1s)
        (not 
          (q_26s))
      )
    )
  (:action o_sync_q_26s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_26s))
    :effect
      (and
        (q_13s)
        (q_26)
        (q_27)
        (not 
          (q_26s))
      )
    )
  (:action o_sync_q_27s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_27s))
    :effect
(not 
        (q_27s))    )
  (:action o_sync_q_28s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_28s))
    :effect
      (and
        (not 
          (q_28s))
        (not 
          (f_ok))
      )
    )
)