require_relative 'engine'
require_relative 'validator'

module Lift
  class Main

    include Validator

    def initialize
      @weight = 0
      @engine = Engine.new # Composite pattern.
    end

    def move floor
      @engine.floor = floor

      if valid? :floor_range, :floor_current, :weight
        @engine.move floor # Delegation pattern.
      else
        puts @error
      end
    end

    def load! weight
      @weight += weight
      puts "Load: the current weight is #{@weight} kg."
    end

    def release! weight
      @weight -= weight
      puts "Release: the current weight is #{@weight} kg."
    end

  end
end
