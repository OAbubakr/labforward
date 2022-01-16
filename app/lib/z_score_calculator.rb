# frozen_string_literal: true

# Calculates ZScore sevice class
class ZScoreCalculator
  def initialize(args)
    @readings = args[:data]
    @threshold = args[:threshold]
  end

  def perform
    sum = @readings.sum.to_f
    count = @readings.count
    return [] if count.zero?

    mean = sum / count

    variance = @readings.map { |reading| (reading - mean)**2 }.sum / count

    # variance is zero, not peaks
    return Array.new(@readings.count) { 0 } if variance.zero?

    standard_deviation = variance**0.5
    @readings.map do |reading|
      z_score = (reading - mean) / standard_deviation
      # This will mark only peaks, troughs will be neglected
      z_score > @threshold ? 1 : 0
    end
  end
end
