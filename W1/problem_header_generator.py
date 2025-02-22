


class LunarLockoutDumper:
    def __init__(self, board_size, spacecraft_positions, goal_position):
        self.board_size = board_size
        self.spacecraft_positions = spacecraft_positions
        self.goal_position = goal_position
        self.text = ''
    def add(self, text):
        self.text += '\n'+text

    def print_game_look(self):
        matrix =[['.' for _ in range(self.board_size[1])] for _ in range(self.board_size[0])]
        matrix[self.goal_position[0]-1][self.goal_position[1]-1] = '#'
        sp = self.spacecraft_positions[0]
        for i, sp in enumerate(self.spacecraft_positions):
            matrix[sp[0]-1][sp[1]-1] = str(i)
        self.add(';    Game looks like:')
        for row in matrix:
            self.add(';  '+''.join(row))
        self.add('; Goal is at {},{}, in case a spacecraft is on top.'.format(self.goal_position[0], self.goal_position[1]))
        self.add(';')


class Domain1(LunarLockoutDumper):
    def generate(self):
        self.print_game_look()
        self.add("(define (problem dynamic1)")
        self.add("  (:domain lunarlockoutdynamic)")
        self.print_obj()
        self.print_init()
        self.print_goal()
        self.print_metric()
        self.add(")")
        return self.text
    
    def print_obj(self):
        self.add("  (:objects")
        positions = ['POS{}_{}'.format(i+1,j+1) for i in range(self.board_size[0]) for j in range(self.board_size[1])]
        self.add("    "+' '.join(positions)+' - position')
        spacecrafts = ['SP{}'.format(i) for i in range(len(self.spacecraft_positions))]
        self.add("    "+' '.join(spacecrafts) + ' - spacecraft')
        self.add("  )")

    def print_init(self):
        self.add("  (:init")
        # Position relationship
        for row in range(1,self.board_size[0]+1):
            preds = ["(just_left_of POS{}_{} POS{}_{})".format(row, col, row, col+1) for col in range(1, self.board_size[1])]
            self.add('    ' + ''.join(preds))
        for col in range(1,self.board_size[1]+1):
            preds = ["(just_above_of POS{}_{} POS{}_{})".format(row, col, row+1, col) for row in range(1, self.board_size[0])]
            self.add('    ' + ''.join(preds))
        # Position emptiness
        empties = ["(empty POS{}_{})".format(row, col) for row in range(1,self.board_size[0]+1) for col in range(1,self.board_size[1]+1) if (row,col) not in self.spacecraft_positions]
        self.add('    ' + ''.join(empties))
        # Spacecraft ats
        ats = ["(at SP{} POS{}_{})".format(sp,r,c) for sp, (r,c) in enumerate(self.spacecraft_positions)]
        self.add('    ' + ''.join(ats))
        self.add('    (static)')
        self.add('    (= (moves) 0)')
        self.add("  )")

    def print_goal(self):
        self.add("  (:goal")
        self.add("    (and")
        self.add("      (at SP0 POS{}_{})".format(self.goal_position[0],self.goal_position[1]))
        self.add("      (static)")
        self.add("    )")
        self.add("  )")
    def print_metric(self):
        self.add("  (:metric\n    minimize (moves)\n  )")

class Domain2(LunarLockoutDumper):
    def generate(self):
        self.print_game_look()
        self.add("(define (problem static1)")
        self.add("  (:domain lunarlockoutstatic)")
        self.print_obj()
        self.print_init()
        self.print_goal()
        self.add(")")
        return self.text
    
    def print_obj(self):
        self.add("  (:objects")
        self.max_side = max(self.board_size[0],self.board_size[0])
        positions = ['i{}'.format(i) for i in range(1, self.max_side+1)]
        self.add("    "+' '.join(positions)+' - gridindex')
        spacecrafts = ['SP{}'.format(i) for i in range(len(self.spacecraft_positions))]
        self.add("    "+' '.join(spacecrafts) + ' - spacecraft')
        self.add("  )")

    def print_init(self):
        self.add("  (:init")
        # Position relationship
        # Just_Less
        preds = ["(just_less i{} i{})".format(i, i+1) for i in range(1, self.max_side)]
        self.add('    ' + ''.join(preds))
        # Less
        preds = []
        for i in range(1, self.max_side):
            preds += ['(less i{} i{})'.format(i, j) for j in range(i+1, self.max_side+1)]
        self.add('    ' + ''.join(preds))
        # Position emptiness
        empties = ["(empty i{} i{})".format(row, col) for row in range(1,self.board_size[0]+1) for col in range(1,self.board_size[1]+1) if (row,col) not in self.spacecraft_positions]
        self.add('    ' + ''.join(empties))
        # Spacecraft ats
        ats = ["(at SP{} i{} i{})".format(sp,r,c) for sp, (r,c) in enumerate(self.spacecraft_positions)]
        self.add('    ' + ''.join(ats))
        self.add("  )")

    def print_goal(self):
        self.add("  (:goal")
        self.add("    (at SP0 i{} i{})".format(self.goal_position[0],self.goal_position[1]))
        self.add("  )")





p1 = {
    "board":(5,5),
    "spacecrafts":[(5,5),(1,5),(2,3),(3,2),(4,4)],
    "goal":(3,3)
}
p2 = {"board":(5,5),
    "spacecrafts":[(1,1),(5,2),(4,4),(2,2),(1,4)],
    "goal":(3,3)
}
p3 = {"board":(5,5),
    "spacecrafts":[(1,1),(1,4),(1,2),(4,3),(4,2)],
    "goal":(3,3)
}
p3T = {"board":(5,5),
    "spacecrafts":[(1,1),(4,1),(2,1),(3,4),(2,4)],
    "goal":(3,3)
}
simple_problem = p3T
problem = Domain2(simple_problem['board'], simple_problem['spacecrafts'], simple_problem['goal'])
print(problem.generate())
