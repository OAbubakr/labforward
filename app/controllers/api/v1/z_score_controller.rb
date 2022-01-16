# frozen_string_literal: true

module Api
  module V1
    # ZScore calculating APIs
    class ZScoreController < ApplicationController
      def moving_z_score
        result = MovingZScoreCalculator.new(z_score_params).perform
        render json: { signal: result }
      end

      def z_score
        result = ZScoreCalculator.new(z_score_params).perform
        render json: { signal: result }
      end

      private

      def z_score_params
        param! :data, Array, required: true do |array, index|
          array.param! index, Float, required: true
        end

        param! :threshold, Float, required: true
        params.permit(:threshold, data: []).to_h
      end
    end
  end
end
