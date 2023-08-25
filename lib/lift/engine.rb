module Lift
  class Engine

    attr_reader :current_floor
    attr_accessor :floor

    def initialize
      @current_floor = 1
    end

    def move floor
      floor > @current_floor ? up(floor) : down(floor)
      set_current_floor! floor
      puts "Stop. The current floor number is #{@current_floor}."
    end


    private

    def up floor
      puts "Start. Moving up."
      @current_floor.upto(floor) do |i|
        sleep 1
        puts "Floor number #{i}."
      end
    end

    def down floor
      puts "Start. Moving down."
      @current_floor.downto(floor) do |i|
        sleep 1
        puts "Floor number #{i}."
      end
    end

    def set_current_floor! floor
      @current_floor = floor
    end

  end
end
