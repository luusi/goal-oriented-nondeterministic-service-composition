(define (domain composition)
	(:requirements :strips :typing :conditional-effects)
	(:constants s0_handler_cleaning_0 - state s1_handler_film_deposition_0 - state s2_handler_resist_coating_0 - state s3_handler_exposure_0 - state)
	(:types state action qstate)
	(:predicates (current_state_0 ?s - state) (current_state_1 ?s - state) (current_state_2 ?s - state) (current_state_3 ?s - state) (cleaning) (exposure) (film_deposition) (resist_coating) (startsymb) (oldautstate ?q - qstate) (newautstate ?q - qstate) (world_mode) (trans_mode) (sync_mode) (dummy_goal))
	(:action startaction
		:precondition (and (startsymb) (world_mode) )
		:effect (and (trans_mode) (not (startsymb)) (not (world_mode)))
	)
	(:action cleaning_0_handler_cleaning_0
		:precondition (and (current_state_0 s0_handler_cleaning_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_0 s0_handler_cleaning_0) (cleaning) (trans_mode) (not (exposure)) (not (film_deposition)) (not (resist_coating)) (not (world_mode)))
	)
	(:action exposure_3_handler_exposure_0
		:precondition (and (current_state_3 s3_handler_exposure_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_3 s3_handler_exposure_0) (exposure) (trans_mode) (not (cleaning)) (not (film_deposition)) (not (resist_coating)) (not (world_mode)))
	)
	(:action film_deposition_1_handler_film_deposition_0
		:precondition (and (current_state_1 s1_handler_film_deposition_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_1 s1_handler_film_deposition_0) (film_deposition) (trans_mode) (not (cleaning)) (not (exposure)) (not (resist_coating)) (not (world_mode)))
	)
	(:action resist_coating_2_handler_resist_coating_0
		:precondition (and (current_state_2 s2_handler_resist_coating_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_2 s2_handler_resist_coating_0) (resist_coating) (trans_mode) (not (cleaning)) (not (exposure)) (not (film_deposition)) (not (world_mode)))
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
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (film_deposition) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q3_t8
		:precondition (and (trans_mode) (oldautstate q3) (cleaning) (exposure) )
		:effect (newautstate q3)
	)
	(:action trans_aut_q4_t9
		:precondition (and (trans_mode) (oldautstate q4) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t10
		:precondition (and (trans_mode) (oldautstate q4) (film_deposition) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q4_t11
		:precondition (and (trans_mode) (oldautstate q4) (film_deposition) (resist_coating) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t12
		:precondition (and (trans_mode) (oldautstate q4) (exposure) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q4_t13
		:precondition (and (trans_mode) (oldautstate q4) (cleaning) )
		:effect (newautstate q4)
	)
	(:action trans_aut_q5_t14
		:precondition (and (trans_mode) (oldautstate q5) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t15
		:precondition (and (trans_mode) (oldautstate q5) (resist_coating) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q5_t16
		:precondition (and (trans_mode) (oldautstate q5) (film_deposition) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t17
		:precondition (and (trans_mode) (oldautstate q5) (exposure) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q5_t18
		:precondition (and (trans_mode) (oldautstate q5) (cleaning) )
		:effect (newautstate q5)
	)
	(:action trans_aut_q6_t19
		:precondition (and (trans_mode) (oldautstate q6) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t20
		:precondition (and (trans_mode) (oldautstate q6) (exposure) )
		:effect (and (newautstate q7) (dummy_goal))
	)
	(:action trans_aut_q6_t21
		:precondition (and (trans_mode) (oldautstate q6) (exposure) (resist_coating) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t22
		:precondition (and (trans_mode) (oldautstate q6) (exposure) (film_deposition) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q6_t23
		:precondition (and (trans_mode) (oldautstate q6) (cleaning) )
		:effect (newautstate q6)
	)
	(:action trans_aut_q7_t24
		:precondition (and (trans_mode) (oldautstate q7) )
		:effect (and (newautstate q7) (dummy_goal))
	)
	(:action trans_aut_q8_t25
		:precondition (and (trans_mode) (oldautstate q8) )
		:effect (newautstate q2)
	)
	(:action start_sync
		:precondition (and (trans_mode) )
		:effect (and (sync_mode) (not (trans_mode)) (not (oldautstate q0)) (not (oldautstate q1)) (not (oldautstate q2)) (not (oldautstate q3)) (not (oldautstate q4)) (not (oldautstate q5)) (not (oldautstate q6)) (not (oldautstate q7)) (not (oldautstate q8)))
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
	(:action continue
		:precondition (and (sync_mode) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)) (not (newautstate q6)) (not (newautstate q7)) (not (newautstate q8)))
		:effect (and (world_mode) (not (sync_mode)) (not (dummy_goal)))
	)
)
