# frozen_string_literal: true

# Calculates Moving z-score
class MovingZScoreCalculator
  def initialize(args)
    @sum = 0.0
    @sum_squared = 0.0
    @count = 0
    @readings = args[:data]
    @threshold = args[:threshold]
  end

  def perform
    res = []
    @readings.each do |reading|
      @sum += reading
      @count += 1
      @sum_squared += reading**2
      mean = @sum / @count
      variance_factor = @sum_squared - 2 * mean * @sum + @count * (mean**2)

      if variance_factor.zero?
        res << 0.0
        next
      end

      variance = variance_factor / @count
      standard_deviation = variance**0.5
      z_score = (reading - mean) / standard_deviation

      res << z_score
    end

    # This will mark only peaks, troughs will be neglected
    res.map { |z_score| z_score > @threshold ? 1 : 0 }
  end
end
