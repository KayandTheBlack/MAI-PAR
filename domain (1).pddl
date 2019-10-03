(define (domain lunar)
  (:requirements :strips :adl :typing)
  (:types
    row - object
    col - object
    spacecraft - object
    redplayer - spacecraft
    helper - spacecraft
  )

  (:predicates
    (is_board ?x - row ?y - col) ;the position (x,y) belongs to the board
    (is_border ?x - row ?y - col) ;the position (x,y) belongs to the boundary of 
    ;the board
    
    (at ?s - spacecraft ?x - row ?y - col) ;the spacecraft s is at position (x,y)
    (is_empty ?x - row ?y - col) ;the position (x,y) is empty
  )
  
  ; v1. the spacecraft can perfom movements of one unit iff the position is 
  ; empty and is inside the board
  (:action move
    :parameters (?s - spacecraft ?x1 - row ?y1 - col ?x2 - row ?y2 - col)
    :precondition (and (is_board ?x1 ?y1) 
                       (is_board ?x2 ?y2)
                       (at ?s ?x1 ?y1)
                       (not (is_empty ?x1 ?y1))
                       (is_empty ?x2 ?y2)
                   )
    :effect (and (not (is_empty ?x2 ?y2))
                 (is_empty ?x1 ?y1)
                 (at ?s ?x2 ?y2)
            )
  )
)