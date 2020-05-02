# There is a robot that is initially at origin. A robot have three operations, he can either turn left or turn right, or he can move one unit ahead in the direction he is facing.
# Given a string containing L (turn left), R (turn right), G (move one unit ahead).Find if the robot again reaches the point he has been before (find a loop).
# Example: LGRGRGG
# Initial co-ordinate is (0, 0), it turns left and moves one unit, updated coordinates (-1,0).
# Then turns right and moves one unit, updated coordinates (-1, 1).Then turns right and moves two unit (two ‘G’s). Updated coordinates are (1, 1).

# initially it stands at 0, 0 and looks east

#       north
# west          east

#       south


def move(instructions)
  directions = {
    east: {R: :south, L: :north},
    south: {R: :west, L: :east},
    west: {R: :north, L: :south},
    north: {R: :east, L: :west}
  }

  moves = {
    east: {x: 1, y: 0},
    west: {x: -1, y: 0},
    south: {x: 0, y: -1},
    north: {x: 0, y: 1}
  }

  direction = :east
  x = 0
  y = 0

  instructions.each do |instruction|
    if instruction == 'R' || instruction == 'L'
      direction = directions[direction][instruction]
    elsif instruction == 'G'
      x += moves[direction][:x]
      y += moves[direction][:y]
    end
  end

  return x == 0 && y == 0
end

puts move 'GLGLGLG'.split
puts move 'GGGGL'.chars
