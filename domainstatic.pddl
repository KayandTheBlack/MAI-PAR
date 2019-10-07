(define (domain lunarlockoutstatic)
  (:requirements :strips :adl :typing)
  (:types
    gridindex - object  ; Any position on the board is composed by two grid indices. 
    spacecraft - object ; Spacecraft on original problem.
  )
  (:predicates
    (less ?i - gridindex ?j - gridindex) ; Example: less 1 4 is true. less 4 1 is false
    (just_less ?i - gridindex ?j - gridindex) ; Example: just_less 1 2. just_less 1 4 is false.
    (empty ?i - gridindex ?j - gridindex) ; There is a spacecraft at (i,j). This predicate is for optimising the foralls and edges. It could be deleted if we also manage to handle edges of the board (f.ex: forall (i), less rt i. for checking if rt is top row.
    (at ?sp -spacecraft ?r - gridindex ?c - gridindex) ; spacecraft at position
  )
  ; Each action is a movement of a spacecraft in a direction. For the movement to be valid, we need to see the following
  ;  Example for up:
  ;   The target position is in the same column than the spacecraft.
  ;   The target position row is less than the row of the spacecraft.
  ;   The target position needs to be empty
  ;   The position of the same column but just_less than the target position needs to be non-empty
  ;   All positions of the same column whose row is less than the spacecraft but target position row 
  ;       is less than them need to be empty.
  ;  For other predicates it will be the same, but interchanging rows and columns for horisontality and the less parameters for switching movement direction.
  ; For simplicity, we consider the edges of our board as non-empty positions, which can be used to stop movement.
  (:action moveup
    :parameters (?sp - spacecraft ?ri - gridindex ?ci - gridindex ?rt - gridindex ?re -gridindex) ; read as row ini, col ini, row target, row extra (limit)
    :precondition (and
                    (at ?sp ?ri ?ci)
                    (less ?rt ?ri)
                    (just_less ?re ?rt)
                    (empty ?rt ?ci)
                    (not (empty ?re ?ci))
                    (forall (?raux - gridindex)
                      (not (and
                        (not (empty ?raux ?ci))
                        (less ?raux ?ri)
                        (less ?rt ?raux)
                      ))
                    )
                  )
    :effect (and 
              (not (at ?sp ?ri ?ci))
              (empty ?ri ?ci)
              (at ?sp ?rt ?ci)
              (not (empty ?rt ?ci))
            )
  )
  (:action movedown
    :parameters (?sp - spacecraft ?ri - gridindex ?ci - gridindex ?rt - gridindex ?re -gridindex) ; read as row ini, col ini, row target, row extra (limit)
    :precondition (and
                    (at ?sp ?ri ?ci)
                    (less ?ri ?rt)
                    (just_less ?rt ?re)
                    (empty ?rt ?ci)
                    (not (empty ?re ?ci))
                    (forall (?raux - gridindex)
                      (not (and
                        (not (empty ?raux ?ci))
                        (less ?ri ?raux)
                        (less ?raux ?rt)
                      ))
                    )
                  )
    :effect (and 
              (not (at ?sp ?ri ?ci))
              (empty ?ri ?ci)
              (at ?sp ?rt ?ci)
              (not (empty ?rt ?ci))
            )
  )

  (:action moveleft
    :parameters (?sp - spacecraft ?ri - gridindex ?ci - gridindex ?ct - gridindex ?ce -gridindex) ; read as row ini, col ini, col target, col extra (limit)
    :precondition (and
                    (at ?sp ?ri ?ci)
                    (less ?ct ?ci)
                    (just_less ?ce ?ct)
                    (empty ?ri ?ct)
                    (not (empty ?ri ?ce))
                    (forall (?caux - gridindex)
                      (not (and
                        (not (empty ?ri ?caux))
                        (less ?ct ?caux)
                        (less ?caux ?ci)
                      ))
                    )
                  )
    :effect (and 
              (not (at ?sp ?ri ?ci))
              (empty ?ri ?ci)
              (at ?sp ?ri ?ct)
              (not (empty ?ri ?ct))
            )
  )
  (:action moveright
    :parameters (?sp - spacecraft ?ri - gridindex ?ci - gridindex ?ct - gridindex ?ce -gridindex) ; read as row ini, col ini, col target, col extra (limit)
    :precondition (and
                    (at ?sp ?ri ?ci)
                    (less ?ci ?ct)
                    (just_less ?ct ?ce)
                    (empty ?ri ?ct)
                    (not (empty ?ri ?ce))
                    (forall (?caux - gridindex)
                      (not (and
                        (not (empty ?ri ?caux))
                        (less ?caux ?ct)
                        (less ?ci ?caux)
                      ))
                    )
                  )
    :effect (and 
              (not (at ?sp ?ri ?ci))
              (empty ?ri ?ci)
              (at ?sp ?ri ?ct)
              (not (empty ?ri ?ct))
            )
  )
)

