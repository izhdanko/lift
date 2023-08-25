module Lift
  module Validator

    MAX_WEIGHT = 500
    FLOOR_RANGE = (1..25)

    def valid? *args
      clear_error!

      args.each do |validator_name|
        send "check_#{validator_name}!"
      end

      @error.nil? ? true : false
    end

    def clear_error!
      @error = nil
    end

    def check_floor_range!
      @error = "The lift cannot start moving because the floor number should be an integer between 1 and 25." unless @engine.floor.instance_of?(Fixnum) && FLOOR_RANGE === @engine.floor
    end

    def check_floor_current!
      @error = "The lift cannot start moving because you are already on the floor number #{@engine.floor}. Please choose another floor number." if @engine.current_floor == @engine.floor
    end

    def check_weight!
      @error = "The lift cannot start moving because the current weight of #{@weight} kg is more than the allowed weight of #{MAX_WEIGHT} kg." unless allowed_weight?
    end

    def allowed_weight?
      @weight <= MAX_WEIGHT
    end

  end
end
