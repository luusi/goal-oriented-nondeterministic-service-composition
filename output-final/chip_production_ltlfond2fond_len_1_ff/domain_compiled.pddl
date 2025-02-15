(define (domain composition)
	(:requirements :strips :typing :conditional-effects)
	(:constants s0_handler_cleaning_0 - state)
	(:types state action qstate)
	(:predicates (current_state_0 ?s - state) (cleaning) (startsymb) (oldautstate ?q - qstate) (newautstate ?q - qstate) (world_mode) (trans_mode) (sync_mode) (dummy_goal))
	(:action startaction
		:precondition (and (startsymb) (world_mode) )
		:effect (and (trans_mode) (not (startsymb)) (not (world_mode)))
	)
	(:action cleaning_0_handler_cleaning_0
		:precondition (and (current_state_0 s0_handler_cleaning_0) (world_mode) (not (startsymb)))
		:effect (and (current_state_0 s0_handler_cleaning_0) (cleaning) (trans_mode) (not (world_mode)))
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
		:effect (and (newautstate q4) (dummy_goal))
	)
	(:action trans_aut_q4_t6
		:precondition (and (trans_mode) (oldautstate q4) )
		:effect (and (newautstate q4) (dummy_goal))
	)
	(:action trans_aut_q5_t7
		:precondition (and (trans_mode) (oldautstate q5) )
		:effect (newautstate q2)
	)
	(:action start_sync
		:precondition (and (trans_mode) )
		:effect (and (sync_mode) (not (trans_mode)) (not (oldautstate q0)) (not (oldautstate q1)) (not (oldautstate q2)) (not (oldautstate q3)) (not (oldautstate q4)) (not (oldautstate q5)))
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
	(:action continue
		:precondition (and (sync_mode) (not (newautstate q0)) (not (newautstate q1)) (not (newautstate q2)) (not (newautstate q3)) (not (newautstate q4)) (not (newautstate q5)))
		:effect (and (world_mode) (not (sync_mode)) (not (dummy_goal)))
	)
)
