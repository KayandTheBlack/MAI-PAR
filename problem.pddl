(define (problem LunarLockoutGame)
    (:domain lunar)
    (:objects
    
    ; Names of the spacecrafters
    
    s_orange
    s_yellow
    s_green
    s_purple
    - helper
    
    s_red 
    - redplayer
    
    x1
    x2
    x3
    x4
    x5
    - row
    
    y1
    y2
    y3
    y4
    y5
    - col
    )
    
    (:init
        ; Board definition
        (is_board x1 y1)
        (is_board x1 y2)
        (is_board x1 y3)
        (is_board x1 y4)
        (is_board x1 y5)
        (is_board x2 y1)
        (is_board x2 y2)
        (is_board x2 y3)
        (is_board x2 y4)
        (is_board x2 y5)
        (is_board x3 y1)
        (is_board x3 y2)
        (is_board x3 y3)
        (is_board x3 y4)
        (is_board x3 y5)
        (is_board x4 y1)
        (is_board x4 y2)
        (is_board x4 y3)
        (is_board x4 y4)
        (is_board x4 y5)
        (is_board x5 y1)
        (is_board x5 y2)
        (is_board x5 y3)
        (is_board x5 y4)
        (is_board x5 y5)
        
        ; Positions for each spacecrafter
        (at s_orange x1 y5)
        (not (is_empty x1 y5))
        
        (at s_green x2 y3)
        (not (is_empty x2 y3))
        
        (at s_purple x3 y2)
        (not (is_empty x3 y2))
        
        (at s_yellow x4 y4)
        (not (is_empty x4 y4))
        
        (at s_red x5 y5)
        (not (is_empty x5 y5))
        
        ; State for the other positions
        (is_empty x1 y1)
        (is_empty x1 y2)
        (is_empty x1 y3)
        (is_empty x1 y4)
        
        (is_empty x2 y1)
        (is_empty x2 y2)
        (is_empty x2 y4)
        (is_empty x2 y5)
        
        (is_empty x3 y1)
        (is_empty x3 y3)
        (is_empty x3 y4)
        (is_empty x3 y5)
        
        (is_empty x4 y1)
        (is_empty x4 y2)
        (is_empty x4 y3)
        (is_empty x4 y5)
        
        (is_empty x5 y1)
        (is_empty x5 y2)
        (is_empty x5 y3)
        (is_empty x5 y4)
    )
    
    (:goal (at s_red x3 y3))
)