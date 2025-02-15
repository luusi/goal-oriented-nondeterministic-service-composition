(define (domain composition)
	(:requirements :strips :typing :conditional-effects)
	(:constants s0_handler_cleaning_0 - state s1_handler_film_deposition_0 - state s2_handler_resist_coating_0 - state s3_handler_exposure_0 - state s4_handler_development_0 - state s5_handler_etching_0 - state s6_handler_impurities_implantation_0 - state s7_handler_activation_0 - state s8_handler_resist_stripping_0 - state s9_handler_assembly_0 - state s10_handler_testing_0 - state)
	(:types state action qstate)
	(:predicates (current_state_0 ?s - state) (current_state_1 ?s - state) (current_state_2 ?s - state) (current_state_3 ?s - state) (current_state_4 ?s - state) (current_state_5 ?s - state) (current_state_6 ?s - state) (current_state_7 ?s - state) (current_state_8 ?s - state) (current_state_9 ?s - state) (current_state_10 ?s - state) (activation) (assembly) (cleaning) (development) (etching) (exposure) (film_deposition) (impurities_implantation) (resist_coating) (resist_stripping) (testing) (startsymb) (oldautstate ?q - qstate) (newautstate ?q - qstate) (world_mode) (trans_mode) (sync_mode) (dummy_goal))
	(:action startaction
		:precondition (and (startsymb) (world_mode) )
		:effect (and (trans_mode) (not (startsymb)) (not (world_mode)))
	)
	(:action activation_7_handler_activation_0
		:precondition (and (current_state_7 s7_handler_activation_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_7 s7_handler_activation_0) (activation) (trans_mode) (not (assembly)) (not (cleaning)) (not (development)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action assembly_9_handler_assembly_0
		:precondition (and (current_state_9 s9_handler_assembly_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_9 s9_handler_assembly_0) (assembly) (trans_mode) (not (activation)) (not (cleaning)) (not (development)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action cleaning_0_handler_cleaning_0
		:precondition (and (current_state_0 s0_handler_cleaning_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_0 s0_handler_cleaning_0) (cleaning) (trans_mode) (not (activation)) (not (assembly)) (not (development)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action development_4_handler_development_0
		:precondition (and (current_state_4 s4_handler_development_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_4 s4_handler_development_0) (development) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action etching_5_handler_etching_0
		:precondition (and (current_state_5 s5_handler_etching_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_5 s5_handler_etching_0) (etching) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (development)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action exposure_3_handler_exposure_0
		:precondition (and (current_state_3 s3_handler_exposure_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_3 s3_handler_exposure_0) (exposure) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (development)) (not (etching)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action film_deposition_1_handler_film_deposition_0
		:precondition (and (current_state_1 s1_handler_film_deposition_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_1 s1_handler_film_deposition_0) (film_deposition) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (development)) (not (etching)) (not (exposure)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action impurities_implantation_6_handler_impurities_implantation_0
		:precondition (and (current_state_6 s6_handler_impurities_implantation_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_6 s6_handler_impurities_implantation_0) (impurities_implantation) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (development)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (resist_coating)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action resist_coating_2_handler_resist_coating_0
		:precondition (and (current_state_2 s2_handler_resist_coating_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_2 s2_handler_resist_coating_0) (resist_coating) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (development)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_stripping)) (not (testing)) (not (world_mode)))
	)
	(:action resist_stripping_8_handler_resist_stripping_0
		:precondition (and (current_state_8 s8_handler_resist_stripping_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_8 s8_handler_resist_stripping_0) (resist_stripping) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (development)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (testing)) (not (world_mode)))
	)
	(:action testing_10_handler_testing_0
		:precondition (and (current_state_10 s10_handler_testing_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_10 s10_handler_testing_0) (testing) (trans_mode) (not (activation)) (not (assembly)) (not (cleaning)) (not (development)) (not (etching)) (not (exposure)) (not (film_deposition)) (not (impurities_implantation)) (not (resist_coating)) (not (resist_stripping)) (not (world_mode)))
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
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q3_t6
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (resist_coating) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t7
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (impurities_implantation) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t8
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (film_deposition) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t9
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (exposure) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t10
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (etching) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t11
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (development) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t12
		:precondition (and (trans_mode) (oldautstate q3) (assembly) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t13
		:precondition (and (trans_mode) (oldautstate q3) (testing) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t14
		:precondition (and (trans_mode) (oldautstate q3) (resist_stripping) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t15
		:precondition (and (trans_mode) (oldautstate q3) (activation) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q4_t16
		:precondition (and (trans_mode) (oldautstate q4) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t17
		:precondition (and (trans_mode) (oldautstate q4) (film_deposition) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q4_t18
		:precondition (and (trans_mode) (oldautstate q4) (film_deposition) (resist_coating) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t19
		:precondition (and (trans_mode) (oldautstate q4) (film_deposition) (impurities_implantation) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t20
		:precondition (and (trans_mode) (oldautstate q4) (exposure) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t21
		:precondition (and (trans_mode) (oldautstate q4) (etching) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t22
		:precondition (and (trans_mode) (oldautstate q4) (development) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t23
		:precondition (and (trans_mode) (oldautstate q4) (cleaning) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t24
		:precondition (and (trans_mode) (oldautstate q4) (assembly) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t25
		:precondition (and (trans_mode) (oldautstate q4) (testing) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t26
		:precondition (and (trans_mode) (oldautstate q4) (resist_stripping) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t27
		:precondition (and (trans_mode) (oldautstate q4) (activation) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q5_t28
		:precondition (and (trans_mode) (oldautstate q5) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t29
		:precondition (and (trans_mode) (oldautstate q5) (resist_coating) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q5_t30
		:precondition (and (trans_mode) (oldautstate q5) (impurities_implantation) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t31
		:precondition (and (trans_mode) (oldautstate q5) (film_deposition) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t32
		:precondition (and (trans_mode) (oldautstate q5) (exposure) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t33
		:precondition (and (trans_mode) (oldautstate q5) (etching) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t34
		:precondition (and (trans_mode) (oldautstate q5) (development) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t35
		:precondition (and (trans_mode) (oldautstate q5) (cleaning) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t36
		:precondition (and (trans_mode) (oldautstate q5) (assembly) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t37
		:precondition (and (trans_mode) (oldautstate q5) (testing) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t38
		:precondition (and (trans_mode) (oldautstate q5) (resist_stripping) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t39
		:precondition (and (trans_mode) (oldautstate q5) (activation) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q6_t40
		:precondition (and (trans_mode) (oldautstate q6) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t41
		:precondition (and (trans_mode) (oldautstate q6) (exposure) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q6_t42
		:precondition (and (trans_mode) (oldautstate q6) (exposure) (resist_coating) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t43
		:precondition (and (trans_mode) (oldautstate q6) (exposure) (impurities_implantation) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t44
		:precondition (and (trans_mode) (oldautstate q6) (exposure) (film_deposition) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t45
		:precondition (and (trans_mode) (oldautstate q6) (etching) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t46
		:precondition (and (trans_mode) (oldautstate q6) (development) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t47
		:precondition (and (trans_mode) (oldautstate q6) (cleaning) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t48
		:precondition (and (trans_mode) (oldautstate q6) (assembly) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t49
		:precondition (and (trans_mode) (oldautstate q6) (testing) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t50
		:precondition (and (trans_mode) (oldautstate q6) (resist_stripping) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t51
		:precondition (and (trans_mode) (oldautstate q6) (activation) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q7_t52
		:precondition (and (trans_mode) (oldautstate q7) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t53
		:precondition (and (trans_mode) (oldautstate q7) (development) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q7_t54
		:precondition (and (trans_mode) (oldautstate q7) (development) (resist_coating) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t55
		:precondition (and (trans_mode) (oldautstate q7) (development) (impurities_implantation) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t56
		:precondition (and (trans_mode) (oldautstate q7) (development) (film_deposition) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t57
		:precondition (and (trans_mode) (oldautstate q7) (development) (exposure) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t58
		:precondition (and (trans_mode) (oldautstate q7) (development) (etching) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t59
		:precondition (and (trans_mode) (oldautstate q7) (cleaning) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t60
		:precondition (and (trans_mode) (oldautstate q7) (assembly) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t61
		:precondition (and (trans_mode) (oldautstate q7) (testing) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t62
		:precondition (and (trans_mode) (oldautstate q7) (resist_stripping) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q7_t63
		:precondition (and (trans_mode) (oldautstate q7) (activation) )
		:effect (newautstate q7)
	)
	(:action trans_aut_q8_t64
		:precondition (and (trans_mode) (oldautstate q8) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t65
		:precondition (and (trans_mode) (oldautstate q8) (etching) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q8_t66
		:precondition (and (trans_mode) (oldautstate q8) (etching) (resist_coating) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t67
		:precondition (and (trans_mode) (oldautstate q8) (etching) (impurities_implantation) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t68
		:precondition (and (trans_mode) (oldautstate q8) (etching) (film_deposition) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t69
		:precondition (and (trans_mode) (oldautstate q8) (etching) (exposure) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t70
		:precondition (and (trans_mode) (oldautstate q8) (development) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t71
		:precondition (and (trans_mode) (oldautstate q8) (cleaning) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t72
		:precondition (and (trans_mode) (oldautstate q8) (assembly) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t73
		:precondition (and (trans_mode) (oldautstate q8) (testing) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t74
		:precondition (and (trans_mode) (oldautstate q8) (resist_stripping) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q8_t75
		:precondition (and (trans_mode) (oldautstate q8) (activation) )
		:effect (newautstate q8)
	)
	(:action trans_aut_q9_t76
		:precondition (and (trans_mode) (oldautstate q9) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t77
		:precondition (and (trans_mode) (oldautstate q9) (impurities_implantation) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q9_t78
		:precondition (and (trans_mode) (oldautstate q9) (impurities_implantation) (resist_coating) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t79
		:precondition (and (trans_mode) (oldautstate q9) (film_deposition) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t80
		:precondition (and (trans_mode) (oldautstate q9) (exposure) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t81
		:precondition (and (trans_mode) (oldautstate q9) (etching) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t82
		:precondition (and (trans_mode) (oldautstate q9) (development) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t83
		:precondition (and (trans_mode) (oldautstate q9) (cleaning) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t84
		:precondition (and (trans_mode) (oldautstate q9) (assembly) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t85
		:precondition (and (trans_mode) (oldautstate q9) (testing) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t86
		:precondition (and (trans_mode) (oldautstate q9) (resist_stripping) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q9_t87
		:precondition (and (trans_mode) (oldautstate q9) (activation) )
		:effect (newautstate q9)
	)
	(:action trans_aut_q10_t88
		:precondition (and (trans_mode) (oldautstate q10) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t89
		:precondition (and (trans_mode) (oldautstate q10) (activation) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q10_t90
		:precondition (and (trans_mode) (oldautstate q10) (activation) (resist_coating) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t91
		:precondition (and (trans_mode) (oldautstate q10) (activation) (impurities_implantation) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t92
		:precondition (and (trans_mode) (oldautstate q10) (activation) (film_deposition) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t93
		:precondition (and (trans_mode) (oldautstate q10) (activation) (exposure) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t94
		:precondition (and (trans_mode) (oldautstate q10) (activation) (etching) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t95
		:precondition (and (trans_mode) (oldautstate q10) (activation) (development) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t96
		:precondition (and (trans_mode) (oldautstate q10) (activation) (cleaning) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t97
		:precondition (and (trans_mode) (oldautstate q10) (activation) (assembly) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t98
		:precondition (and (trans_mode) (oldautstate q10) (activation) (testing) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q10_t99
		:precondition (and (trans_mode) (oldautstate q10) (activation) (resist_stripping) )
		:effect (newautstate q10)
	)
	(:action trans_aut_q11_t100
		:precondition (and (trans_mode) (oldautstate q11) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t101
		:precondition (and (trans_mode) (oldautstate q11) (resist_stripping) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q11_t102
		:precondition (and (trans_mode) (oldautstate q11) (resist_coating) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t103
		:precondition (and (trans_mode) (oldautstate q11) (impurities_implantation) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t104
		:precondition (and (trans_mode) (oldautstate q11) (film_deposition) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t105
		:precondition (and (trans_mode) (oldautstate q11) (exposure) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t106
		:precondition (and (trans_mode) (oldautstate q11) (etching) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t107
		:precondition (and (trans_mode) (oldautstate q11) (development) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t108
		:precondition (and (trans_mode) (oldautstate q11) (cleaning) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t109
		:precondition (and (trans_mode) (oldautstate q11) (assembly) (resist_stripping) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t110
		:precondition (and (trans_mode) (oldautstate q11) (resist_stripping) (testing) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q11_t111
		:precondition (and (trans_mode) (oldautstate q11) (activation) )
		:effect (newautstate q11)
	)
	(:action trans_aut_q12_t112
		:precondition (and (trans_mode) (oldautstate q12) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t113
		:precondition (and (trans_mode) (oldautstate q12) (assembly) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q12_t114
		:precondition (and (trans_mode) (oldautstate q12) (assembly) (resist_coating) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t115
		:precondition (and (trans_mode) (oldautstate q12) (assembly) (impurities_implantation) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t116
		:precondition (and (trans_mode) (oldautstate q12) (assembly) (film_deposition) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t117
		:precondition (and (trans_mode) (oldautstate q12) (assembly) (exposure) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t118
		:precondition (and (trans_mode) (oldautstate q12) (assembly) (etching) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t119
		:precondition (and (trans_mode) (oldautstate q12) (assembly) (development) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t120
		:precondition (and (trans_mode) (oldautstate q12) (assembly) (cleaning) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t121
		:precondition (and (trans_mode) (oldautstate q12) (testing) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t122
		:precondition (and (trans_mode) (oldautstate q12) (resist_stripping) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q12_t123
		:precondition (and (trans_mode) (oldautstate q12) (activation) )
		:effect (newautstate q12)
	)
	(:action trans_aut_q13_t124
		:precondition (and (trans_mode) (oldautstate q13) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t125
		:precondition (and (trans_mode) (oldautstate q13) (testing) )
		:effect (and (newautstate q14) (dummy_goal))
	)
	(:action trans_aut_q13_t126
		:precondition (and (trans_mode) (oldautstate q13) (resist_coating) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t127
		:precondition (and (trans_mode) (oldautstate q13) (impurities_implantation) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t128
		:precondition (and (trans_mode) (oldautstate q13) (film_deposition) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t129
		:precondition (and (trans_mode) (oldautstate q13) (exposure) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t130
		:precondition (and (trans_mode) (oldautstate q13) (etching) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t131
		:precondition (and (trans_mode) (oldautstate q13) (development) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t132
		:precondition (and (trans_mode) (oldautstate q13) (cleaning) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t133
		:precondition (and (trans_mode) (oldautstate q13) (assembly) (testing) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t134
		:precondition (and (trans_mode) (oldautstate q13) (resist_stripping) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q13_t135
		:precondition (and (trans_mode) (oldautstate q13) (activation) )
		:effect (newautstate q13)
	)
	(:action trans_aut_q14_t136
		:precondition (and (trans_mode) (oldautstate q14) )
		:effect (and (newautstate q14) (dummy_goal))
	)
	(:action trans_aut_q15_t137
		:precondition (and (trans_mode) (oldautstate q15) )
		:effect (newautstate q2)
	)
	(:action start_sync
		:precondition (and (trans_mode) )
		:effect (and (sync_mode) (not (trans_mode)) (not (oldautstate q0)) (not (oldautstate q1)) (not (oldautstate q2)) (not (oldautstate q3)) (not (oldautstate q4)) (not (oldautstate q5)) (not (oldautstate q6)) (not (oldautstate q7)) (not (oldautstate q8)) (not (oldautstate q9)) (not (oldautstate q10)) (not (oldautstate q11)) (not (oldautstate q12)) (not (oldautstate q13)) (not (oldautstate q14)) (not (oldautstate q15)))
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
	(:action sync_q14_pos
		:precondition (and (sync_mode) (newautstate q14) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)) (not (newautstate q10)) (not (newautstate q11)) (not (newautstate q12)) (not (newautstate q13)))
		:effect (and (oldautstate q14) (not (newautstate q14)))
	)
	(:action sync_q15_pos
		:precondition (and (sync_mode) (newautstate q15) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)) (not (newautstate q10)) (not (newautstate q11)) (not (newautstate q12)) (not (newautstate q13)) (not (newautstate q14)))
		:effect (and (oldautstate q15) (not (newautstate q15)))
	)
	(:action continue
		:precondition (and (sync_mode) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)) (not (newautstate q9)) (not (newautstate q10)) (not (newautstate q11)) (not (newautstate q12)) (not (newautstate q13)) (not (newautstate q14)) (not (newautstate q15)))
		:effect (and (world_mode) (not (sync_mode)) (not (dummy_goal)))
	)
)
