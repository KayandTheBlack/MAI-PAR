(define (domain lunar)
  (:requirements :equality :strips :adl :typing)
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
    (x_greater_than ?x1 - row ?x2 - row) 
    (y_greater_than ?y1 - col ?y2 - col)
    (is_boundary ?x - row ?y - col) ; the position (x,y) is a boundary
  )
  
  ; v3. the spacecraft can perfom movements in 4 directions and the final position must be a boundary
  

  (:action moveup
    :parameters (?s - spacecraft ?x1 - row ?y1 - col ?x2 - row ?y2 - col)
    :precondition (and (is_board ?x1 ?y1) 
                       (is_board ?x2 ?y2)
                       (at ?s ?x1 ?y1)
                       (not (is_empty ?x1 ?y1))
                       (is_empty ?x2 ?y2)
                       
                       ; going up
                       (= ?y1 ?y2)
                       (x_greater_than ?x1 ?x2)
                       
                       (is_boundary ?x2 ?y2)
                   )
    :effect (and (not (is_empty ?x2 ?y2))
                 (is_empty ?x1 ?y1)
                 (at ?s ?x2 ?y2)
            )
  )

    
  (:action movedown
    :parameters (?s - spacecraft ?x1 - row ?y1 - col ?x2 - row ?y2 - col)
    :precondition (and (is_board ?x1 ?y1) 
                       (is_board ?x2 ?y2)
                       (at ?s ?x1 ?y1)
                       (not (is_empty ?x1 ?y1))
                       (is_empty ?x2 ?y2)
                       
                       ; going down
                       (= ?y1 ?y2)
                       (x_greater_than ?x2 ?x1)
                       
                       (is_boundary ?x2 ?y2)
                   )
    :effect (and (not (is_empty ?x2 ?y2))
                 (is_empty ?x1 ?y1)
                 (at ?s ?x2 ?y2)
            )
  )
    
  (:action moveleft
    :parameters (?s - spacecraft ?x1 - row ?y1 - col ?x2 - row ?y2 - col)
    :precondition (and (is_board ?x1 ?y1) 
                       (is_board ?x2 ?y2)
                       (at ?s ?x1 ?y1)
                       (not (is_empty ?x1 ?y1))
                       (is_empty ?x2 ?y2)
                       
                       ; going left
                       (= ?x1 ?x2)
                       (y_greater_than ?y1 ?y2)
                       
                       (is_boundary ?x2 ?y2)
                   )
    :effect (and (not (is_empty ?x2 ?y2))
                 (is_empty ?x1 ?y1)
                 (at ?s ?x2 ?y2)
            )
  )
    
  (:action moveright
    :parameters (?s - spacecraft ?x1 - row ?y1 - col ?x2 - row ?y2 - col)
    :precondition (and (is_board ?x1 ?y1) 
                       (is_board ?x2 ?y2)
                       (at ?s ?x1 ?y1)
                       (not (is_empty ?x1 ?y1))
                       (is_empty ?x2 ?y2)
                       
                       ; going right
                       (= ?x1 ?x2)
                       (y_greater_than ?y2 ?y1)
                       
                       (is_boundary ?x2 ?y2)
                   )
    :effect (and (not (is_empty ?x2 ?y2))
                 (is_empty ?x1 ?y1)
                 (at ?s ?x2 ?y2)
            )
  )
)