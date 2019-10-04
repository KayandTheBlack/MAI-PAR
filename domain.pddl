(define (domain lunarlockoutdynamic)
  (:requirements :strips :adl :typing)
  (:types
    position - object
    spacecraft - object
  )
  (:predicates
    (just_left_of ?l - position ?r - position) ; position l is left of position r, exactly next to it
    (just_above_of ?u - position ?d - position) ; position u is above of position d, exactly next to it
    (empty ?p - position)
    (at ?sp -spacecraft ?pos - position) ; spacecraft at position
    (movingup ?sp - spacecraft)
    (movingleft ?sp - spacecraft)
    (movingdown ?sp - spacecraft)
    (movingright ?sp - spacecraft)
    (static)
  )

  (:action startmoveup
    :parametres (?sp - spacecraft)
    :precondition (static)
    :effect (and 
              (movingup ?sp)
              (not (static))
            )
  )
  (:action moveup
    :parametres (?sp - spacecraft ?ini - position ?fi - position)
    :precondition (and 
              (movingup ?sp)
              (at ?sp ?ini)
              (just_above_of ?fi ?ini)
              (empty ?fi)
            )
    :effect (and 
              (empty ?ini)
              (not (at ?sp ?ini))
              (not (empty ?fi))
              (at ?sp ?fi)
            )
  )
  (:action stopmoveup
    :parametres (?sp - spacecraft ?ini - position ?lim - position)
    :precondition (and 
              (movingup ?sp)
              (at ?sp ?ini)
              (just_above_of ?lim ?ini)
              (not(empty ?lim))
            )
    :effect (and 
              (not (movingup ?sp))
              (static)
            )
  )
)

