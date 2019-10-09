
;    Game looks like:
;  02.1.
;  .....
;  ..#..
;  .43..
;  .....
; Goal is at 3,3, in case a spacecraft is on top.
;
(define (problem static1)
  (:domain lunarlockoutstatic)
  (:objects
    i1 i2 i3 i4 i5 - gridindex
    SP0 SP1 SP2 SP3 SP4 - spacecraft
  )
  (:init
    (just_less i1 i2)(just_less i2 i3)(just_less i3 i4)(just_less i4 i5)
    (less i1 i2)(less i1 i3)(less i1 i4)(less i1 i5)(less i2 i3)(less i2 i4)(less i2 i5)(less i3 i4)(less i3 i5)(less i4 i5)
    (empty i1 i3)(empty i1 i5)(empty i2 i1)(empty i2 i2)(empty i2 i3)(empty i2 i4)(empty i2 i5)(empty i3 i1)(empty i3 i2)(empty i3 i3)(empty i3 i4)(empty i3 i5)(empty i4 i1)(empty i4 i4)(empty i4 i5)(empty i5 i1)(empty i5 i2)(empty i5 i3)(empty i5 i4)(empty i5 i5)
    (at SP0 i1 i1)(at SP1 i1 i4)(at SP2 i1 i2)(at SP3 i4 i3)(at SP4 i4 i2)
  )
  (:goal
    (at SP0 i3 i3)
  )
)
