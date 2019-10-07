
;    Game looks like:
;  0..4.
;  .3...
;  ..#..
;  ...2.
;  .1...
; Goal is at 3,3, in case a spacecraft is on top.
;
(define (problem dynamic1)
  (:domain lunarlockoutdynamic)
  (:objects
    POS0_0 POS0_1 POS0_2 POS0_3 POS0_4 POS0_5 POS0_6 POS1_0 POS1_1 POS1_2 POS1_3 POS1_4 POS1_5 POS1_6 POS2_0 POS2_1 POS2_2 POS2_3 POS2_4 POS2_5 POS2_6 POS3_0 POS3_1 POS3_2 POS3_3 POS3_4 POS3_5 POS3_6 POS4_0 POS4_1 POS4_2 POS4_3 POS4_4 POS4_5 POS4_6 POS5_0 POS5_1 POS5_2 POS5_3 POS5_4 POS5_5 POS5_6 POS6_0 POS6_1 POS6_2 POS6_3 POS6_4 POS6_5 POS6_6 - position
    SP0 SP1 SP2 SP3 SP4 - spacecraft
  )
  (:init
    (just_left_of POS1_0 POS1_1)(just_left_of POS1_1 POS1_2)(just_left_of POS1_2 POS1_3)(just_left_of POS1_3 POS1_4)(just_left_of POS1_4 POS1_5)(just_left_of POS1_5 POS1_6)
    (just_left_of POS2_0 POS2_1)(just_left_of POS2_1 POS2_2)(just_left_of POS2_2 POS2_3)(just_left_of POS2_3 POS2_4)(just_left_of POS2_4 POS2_5)(just_left_of POS2_5 POS2_6)
    (just_left_of POS3_0 POS3_1)(just_left_of POS3_1 POS3_2)(just_left_of POS3_2 POS3_3)(just_left_of POS3_3 POS3_4)(just_left_of POS3_4 POS3_5)(just_left_of POS3_5 POS3_6)
    (just_left_of POS4_0 POS4_1)(just_left_of POS4_1 POS4_2)(just_left_of POS4_2 POS4_3)(just_left_of POS4_3 POS4_4)(just_left_of POS4_4 POS4_5)(just_left_of POS4_5 POS4_6)
    (just_left_of POS5_0 POS5_1)(just_left_of POS5_1 POS5_2)(just_left_of POS5_2 POS5_3)(just_left_of POS5_3 POS5_4)(just_left_of POS5_4 POS5_5)(just_left_of POS5_5 POS5_6)
    (just_above_of POS0_1 POS1_1)(just_above_of POS1_1 POS2_1)(just_above_of POS2_1 POS3_1)(just_above_of POS3_1 POS4_1)(just_above_of POS4_1 POS5_1)(just_above_of POS5_1 POS6_1)
    (just_above_of POS0_2 POS1_2)(just_above_of POS1_2 POS2_2)(just_above_of POS2_2 POS3_2)(just_above_of POS3_2 POS4_2)(just_above_of POS4_2 POS5_2)(just_above_of POS5_2 POS6_2)
    (just_above_of POS0_3 POS1_3)(just_above_of POS1_3 POS2_3)(just_above_of POS2_3 POS3_3)(just_above_of POS3_3 POS4_3)(just_above_of POS4_3 POS5_3)(just_above_of POS5_3 POS6_3)
    (just_above_of POS0_4 POS1_4)(just_above_of POS1_4 POS2_4)(just_above_of POS2_4 POS3_4)(just_above_of POS3_4 POS4_4)(just_above_of POS4_4 POS5_4)(just_above_of POS5_4 POS6_4)
    (just_above_of POS0_5 POS1_5)(just_above_of POS1_5 POS2_5)(just_above_of POS2_5 POS3_5)(just_above_of POS3_5 POS4_5)(just_above_of POS4_5 POS5_5)(just_above_of POS5_5 POS6_5)
    (empty POS1_2)(empty POS1_3)(empty POS1_5)(empty POS2_1)(empty POS2_3)(empty POS2_4)(empty POS2_5)(empty POS3_1)(empty POS3_2)(empty POS3_3)(empty POS3_4)(empty POS3_5)(empty POS4_1)(empty POS4_2)(empty POS4_3)(empty POS4_5)(empty POS5_1)(empty POS5_3)(empty POS5_4)(empty POS5_5)
    (at SP0 POS1_1)(at SP1 POS5_2)(at SP2 POS4_4)(at SP3 POS2_2)(at SP4 POS1_4)
    (static)
  )
  (:goal
    (and
      (at SP0 POS3_3)
      (static)
    )
  )
)
