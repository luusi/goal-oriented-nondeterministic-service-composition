(define (domain composition)
	(:requirements :strips :typing :conditional-effects)
	(:constants s0_rotor_builder_0 - state s1_stator_builder_0 - state s2_inverter_builder_0 - state s3_motor_assembler_0 - state s4_mechanical_engineer_1_0 - state s5_mechanical_engineer_2_0 - state)
	(:types state action qstate)
	(:predicates (current_state_0 ?s - state) (current_state_1 ?s - state) (current_state_2 ?s - state) (current_state_3 ?s - state) (current_state_4 ?s - state) (current_state_5 ?s - state) (assemble_motor) (build_inverter) (build_rotor) (build_stator) (electric_test) (static_test) (startsymb) (oldautstate ?q - qstate) (newautstate ?q - qstate) (world_mode) (trans_mode) (sync_mode) (dummy_goal))
	(:action startaction
		:precondition (and (startsymb) (world_mode) )
		:effect (and (trans_mode) (not (startsymb)) (not (world_mode)))
	)
	(:action assemble_motor_3_motor_assembler_0
		:precondition (and (current_state_3 s3_motor_assembler_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_3 s3_motor_assembler_0) (assemble_motor) (trans_mode) (not (build_inverter)) (not (build_rotor)) (not (build_stator)) (not (electric_test)) (not (static_test)) (not (world_mode)))
	)
	(:action build_inverter_2_inverter_builder_0
		:precondition (and (current_state_2 s2_inverter_builder_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_2 s2_inverter_builder_0) (build_inverter) (trans_mode) (not (assemble_motor)) (not (build_rotor)) (not (build_stator)) (not (electric_test)) (not (static_test)) (not (world_mode)))
	)
	(:action build_rotor_1_stator_builder_0
		:precondition (and (current_state_1 s1_stator_builder_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_1 s1_stator_builder_0) (build_rotor) (trans_mode) (not (assemble_motor)) (not (build_inverter)) (not (build_stator)) (not (electric_test)) (not (static_test)) (not (world_mode)))
	)
	(:action build_stator_0_rotor_builder_0
		:precondition (and (current_state_0 s0_rotor_builder_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_0 s0_rotor_builder_0) (build_stator) (trans_mode) (not (assemble_motor)) (not (build_inverter)) (not (build_rotor)) (not (electric_test)) (not (static_test)) (not (world_mode)))
	)
	(:action electric_test_4_mechanical_engineer_1_0
		:precondition (and (current_state_4 s4_mechanical_engineer_1_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_4 s4_mechanical_engineer_1_0) (electric_test) (trans_mode) (not (assemble_motor)) (not (build_inverter)) (not (build_rotor)) (not (build_stator)) (not (static_test)) (not (world_mode)))
	)
	(:action static_test_5_mechanical_engineer_2_0
		:precondition (and (current_state_5 s5_mechanical_engineer_2_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_5 s5_mechanical_engineer_2_0) (static_test) (trans_mode) (not (assemble_motor)) (not (build_inverter)) (not (build_rotor)) (not (build_stator)) (not (electric_test)) (not (world_mode)))
	)
	(:action trans_aut_q0_t0
		:precondition (and (trans_mode) (oldautstate q0) )
		:effect (newautstate q1)
	)
	(:action trans_aut_q1_t1
		:precondition (and (trans_mode) (oldautstate q1) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q1_t2
		:precondition (and (trans_mode) (oldautstate q1) (startsymb) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q2_t3
		:precondition (and (trans_mode) (oldautstate q2) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t4
		:precondition (and (trans_mode) (oldautstate q3) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t5
		:precondition (and (trans_mode) (oldautstate q3) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t6
		:precondition (and (trans_mode) (oldautstate q3) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t7
		:precondition (and (trans_mode) (oldautstate q3) (build_inverter) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q3_t8
		:precondition (and (trans_mode) (oldautstate q3) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t9
		:precondition (and (trans_mode) (oldautstate q3) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t10
		:precondition (and (trans_mode) (oldautstate q3) (build_stator) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q3_t11
		:precondition (and (trans_mode) (oldautstate q3) (build_stator) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t12
		:precondition (and (trans_mode) (oldautstate q3) (build_stator) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t13
		:precondition (and (trans_mode) (oldautstate q3) (build_stator) (build_inverter) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q3_t14
		:precondition (and (trans_mode) (oldautstate q3) (build_stator) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t15
		:precondition (and (trans_mode) (oldautstate q3) (build_stator) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t16
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q3_t17
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t18
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t19
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_inverter) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q3_t20
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t21
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t22
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_stator) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q3_t23
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_stator) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t24
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_stator) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t25
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_stator) (build_inverter) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q3_t26
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_stator) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t27
		:precondition (and (trans_mode) (oldautstate q3) (build_rotor) (build_stator) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t28
		:precondition (and (trans_mode) (oldautstate q3) (assemble_motor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t29
		:precondition (and (trans_mode) (oldautstate q3) (assemble_motor) (build_rotor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t30
		:precondition (and (trans_mode) (oldautstate q3) (assemble_motor) (build_rotor) (build_stator) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q3_t31
		:precondition (and (trans_mode) (oldautstate q3) (assemble_motor) (build_rotor) (build_stator) (build_inverter) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q3_t32
		:precondition (and (trans_mode) (oldautstate q3) (assemble_motor) (build_rotor) (build_stator) (build_inverter) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q3_t33
		:precondition (and (trans_mode) (oldautstate q3) (assemble_motor) (build_rotor) (build_stator) (build_inverter) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q4_t34
		:precondition (and (trans_mode) (oldautstate q4) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t35
		:precondition (and (trans_mode) (oldautstate q4) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t36
		:precondition (and (trans_mode) (oldautstate q4) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t37
		:precondition (and (trans_mode) (oldautstate q4) (build_stator) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q4_t38
		:precondition (and (trans_mode) (oldautstate q4) (build_stator) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t39
		:precondition (and (trans_mode) (oldautstate q4) (build_stator) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t40
		:precondition (and (trans_mode) (oldautstate q4) (build_rotor) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q4_t41
		:precondition (and (trans_mode) (oldautstate q4) (build_rotor) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t42
		:precondition (and (trans_mode) (oldautstate q4) (build_rotor) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t43
		:precondition (and (trans_mode) (oldautstate q4) (build_rotor) (build_stator) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q4_t44
		:precondition (and (trans_mode) (oldautstate q4) (build_rotor) (build_stator) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t45
		:precondition (and (trans_mode) (oldautstate q4) (build_rotor) (build_stator) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t46
		:precondition (and (trans_mode) (oldautstate q4) (assemble_motor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t47
		:precondition (and (trans_mode) (oldautstate q4) (assemble_motor) (build_rotor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q4_t48
		:precondition (and (trans_mode) (oldautstate q4) (assemble_motor) (build_rotor) (build_stator) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q4_t49
		:precondition (and (trans_mode) (oldautstate q4) (assemble_motor) (build_rotor) (build_stator) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q4_t50
		:precondition (and (trans_mode) (oldautstate q4) (assemble_motor) (build_rotor) (build_stator) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q5_t51
		:precondition (and (trans_mode) (oldautstate q5) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t52
		:precondition (and (trans_mode) (oldautstate q5) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t53
		:precondition (and (trans_mode) (oldautstate q5) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t54
		:precondition (and (trans_mode) (oldautstate q5) (build_inverter) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q5_t55
		:precondition (and (trans_mode) (oldautstate q5) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t56
		:precondition (and (trans_mode) (oldautstate q5) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t57
		:precondition (and (trans_mode) (oldautstate q5) (build_rotor) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q5_t58
		:precondition (and (trans_mode) (oldautstate q5) (build_rotor) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t59
		:precondition (and (trans_mode) (oldautstate q5) (build_rotor) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t60
		:precondition (and (trans_mode) (oldautstate q5) (build_rotor) (build_inverter) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q5_t61
		:precondition (and (trans_mode) (oldautstate q5) (build_rotor) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t62
		:precondition (and (trans_mode) (oldautstate q5) (build_rotor) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t63
		:precondition (and (trans_mode) (oldautstate q5) (assemble_motor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t64
		:precondition (and (trans_mode) (oldautstate q5) (assemble_motor) (build_rotor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q5_t65
		:precondition (and (trans_mode) (oldautstate q5) (assemble_motor) (build_rotor) (build_inverter) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q5_t66
		:precondition (and (trans_mode) (oldautstate q5) (assemble_motor) (build_rotor) (build_inverter) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q5_t67
		:precondition (and (trans_mode) (oldautstate q5) (assemble_motor) (build_rotor) (build_inverter) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q6_t68
		:precondition (and (trans_mode) (oldautstate q6) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t69
		:precondition (and (trans_mode) (oldautstate q6) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q6_t70
		:precondition (and (trans_mode) (oldautstate q6) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q6_t71
		:precondition (and (trans_mode) (oldautstate q6) (build_rotor) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q6_t72
		:precondition (and (trans_mode) (oldautstate q6) (build_rotor) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q6_t73
		:precondition (and (trans_mode) (oldautstate q6) (build_rotor) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q6_t74
		:precondition (and (trans_mode) (oldautstate q6) (assemble_motor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q6_t75
		:precondition (and (trans_mode) (oldautstate q6) (assemble_motor) (build_rotor) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q6_t76
		:precondition (and (trans_mode) (oldautstate q6) (assemble_motor) (build_rotor) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q6_t77
		:precondition (and (trans_mode) (oldautstate q6) (assemble_motor) (build_rotor) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q7_t78
		:precondition (and (trans_mode) (oldautstate q7) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t79
		:precondition (and (trans_mode) (oldautstate q7) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t80
		:precondition (and (trans_mode) (oldautstate q7) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t81
		:precondition (and (trans_mode) (oldautstate q7) (build_inverter) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q7_t82
		:precondition (and (trans_mode) (oldautstate q7) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t83
		:precondition (and (trans_mode) (oldautstate q7) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t84
		:precondition (and (trans_mode) (oldautstate q7) (build_stator) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q7_t85
		:precondition (and (trans_mode) (oldautstate q7) (build_stator) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t86
		:precondition (and (trans_mode) (oldautstate q7) (build_stator) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t87
		:precondition (and (trans_mode) (oldautstate q7) (build_stator) (build_inverter) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q7_t88
		:precondition (and (trans_mode) (oldautstate q7) (build_stator) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t89
		:precondition (and (trans_mode) (oldautstate q7) (build_stator) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t90
		:precondition (and (trans_mode) (oldautstate q7) (assemble_motor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t91
		:precondition (and (trans_mode) (oldautstate q7) (assemble_motor) (build_stator) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q7_t92
		:precondition (and (trans_mode) (oldautstate q7) (assemble_motor) (build_stator) (build_inverter) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q7_t93
		:precondition (and (trans_mode) (oldautstate q7) (assemble_motor) (build_stator) (build_inverter) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q7_t94
		:precondition (and (trans_mode) (oldautstate q7) (assemble_motor) (build_stator) (build_inverter) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q8_t95
		:precondition (and (trans_mode) (oldautstate q8) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t96
		:precondition (and (trans_mode) (oldautstate q8) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q8_t97
		:precondition (and (trans_mode) (oldautstate q8) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q8_t98
		:precondition (and (trans_mode) (oldautstate q8) (build_stator) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q8_t99
		:precondition (and (trans_mode) (oldautstate q8) (build_stator) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q8_t100
		:precondition (and (trans_mode) (oldautstate q8) (build_stator) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q8_t101
		:precondition (and (trans_mode) (oldautstate q8) (assemble_motor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q8_t102
		:precondition (and (trans_mode) (oldautstate q8) (assemble_motor) (build_stator) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q8_t103
		:precondition (and (trans_mode) (oldautstate q8) (assemble_motor) (build_stator) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q8_t104
		:precondition (and (trans_mode) (oldautstate q8) (assemble_motor) (build_stator) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q9_t105
		:precondition (and (trans_mode) (oldautstate q9) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t106
		:precondition (and (trans_mode) (oldautstate q9) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q9_t107
		:precondition (and (trans_mode) (oldautstate q9) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q9_t108
		:precondition (and (trans_mode) (oldautstate q9) (build_inverter) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q9_t109
		:precondition (and (trans_mode) (oldautstate q9) (build_inverter) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q9_t110
		:precondition (and (trans_mode) (oldautstate q9) (build_inverter) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q9_t111
		:precondition (and (trans_mode) (oldautstate q9) (assemble_motor) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q9_t112
		:precondition (and (trans_mode) (oldautstate q9) (assemble_motor) (build_inverter) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q9_t113
		:precondition (and (trans_mode) (oldautstate q9) (assemble_motor) (build_inverter) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q9_t114
		:precondition (and (trans_mode) (oldautstate q9) (assemble_motor) (build_inverter) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q10_t115
		:precondition (and (trans_mode) (oldautstate q10) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t116
		:precondition (and (trans_mode) (oldautstate q10) (static_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q10_t117
		:precondition (and (trans_mode) (oldautstate q10) (electric_test) )
		:effect (newautstate q2)
	)
	(:action trans_aut_q10_t118
		:precondition (and (trans_mode) (oldautstate q10) (assemble_motor) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q10_t119
		:precondition (and (trans_mode) (oldautstate q10) (assemble_motor) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q10_t120
		:precondition (and (trans_mode) (oldautstate q10) (assemble_motor) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q11_t121
		:precondition (and (trans_mode) (oldautstate q11) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t122
		:precondition (and (trans_mode) (oldautstate q11) (static_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q11_t123
		:precondition (and (trans_mode) (oldautstate q11) (electric_test) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q12_t124
		:precondition (and (trans_mode) (oldautstate q12) )
		:effect (and (newautstate q12) (dummy_goal))
	)
	(:action trans_aut_q13_t125
		:precondition (and (trans_mode) (oldautstate q13) )
		:effect (newautstate q2)
	)
	(:action start_sync
		:precondition (and (trans_mode) )
		:effect (and (sync_mode) (not (trans_mode)) (not (oldautstate q0)) (not (oldautstate q1)) (not (oldautstate q2)) (not (oldautstate q3)) (not (oldautstate q4)) (not (oldautstate q5)) (not (oldautstate q6)) (not (oldautstate q7)) (not (oldautstate q8)) (not (oldautstate q9)) (not (oldautstate q10)) (not (oldautstate q11)) (not (oldautstate q12)) (not (oldautstate q13)))
	)
	(:action sync_q0_pos
		:precondition (and (sync_mode) (newautstate q0) )
		:effect (and (oldautstate q0) (not (newautstate q0)))
	)
	(:action sync_q1_pos
		:precondition (and (sync_mode) (newautstate q1) (not (newautstate q0)))
		:effect (and (oldautstate q1) (not (newautstate q1)))
	)
	(:action sync_q2_pos
		:precondition (and (sync_mode) (newautstate q2) (not (newautstate q0)) (not (newautstate q1)))
		:effect (and (oldautstate q2) (not (newautstate q2)))
	)
	(:action sync_q3_pos
		:precondition (and (sync_mode) (newautstate q3) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)))
		:effect (and (oldautstate q3) (not (newautstate q3)))
	)
	(:action sync_q4_pos
		:precondition (and (sync_mode) (newautstate q4) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)))
		:effect (and (oldautstate q4) (not (newautstate q4)))
	)
	(:action sync_q5_pos
		:precondition (and (sync_mode) (newautstate q5) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)))
		:effect (and (oldautstate q5) (not (newautstate q5)))
	)
	(:action sync_q6_pos
		:precondition (and (sync_mode) (newautstate q6) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)))
		:effect (and (oldautstate q6) (not (newautstate q6)))
	)
	(:action sync_q7_pos
		:precondition (and (sync_mode) (newautstate q7) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)))
		:effect (and (oldautstate q7) (not (newautstate q7)))
	)
	(:action sync_q8_pos
		:precondition (and (sync_mode) (newautstate q8) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)))
		:effect (and (oldautstate q8) (not (newautstate q8)))
	)
	(:action sync_q9_pos
		:precondition (and (sync_mode) (newautstate q9) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)))
		:effect (and (oldautstate q9) (not (newautstate q9)))
	)
	(:action sync_q10_pos
		:precondition (and (sync_mode) (newautstate q10) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)))
		:effect (and (oldautstate q10) (not (newautstate q10)))
	)
	(:action sync_q11_pos
		:precondition (and (sync_mode) (newautstate q11) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)) (not (newautstate q10)))
		:effect (and (oldautstate q11) (not (newautstate q11)))
	)
	(:action sync_q12_pos
		:precondition (and (sync_mode) (newautstate q12) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)) (not (newautstate q10)) (not (newautstate q11)))
		:effect (and (oldautstate q12) (not (newautstate q12)))
	)
	(:action sync_q13_pos
		:precondition (and (sync_mode) (newautstate q13) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)) (not (newautstate q10)) (not (newautstate q11)) (not (newautstate q12)))
		:effect (and (oldautstate q13) (not (newautstate q13)))
	)
	(:action continue
		:precondition (and (sync_mode) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)) (not (newautstate q10)) (not (newautstate q11)) (not (newautstate q12)) (not (newautstate q13)))
		:effect (and (world_mode) (not (sync_mode)) (not (dummy_goal)))
	)
)
