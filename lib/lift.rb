require_relative 'lift/main'

module Lift
end

lift = Lift::Main.new

lift.load! 550
lift.move 10
lift.release! 75
lift.move 10
lift.move 10
lift.load! 25
lift.move 30
lift.move 1
