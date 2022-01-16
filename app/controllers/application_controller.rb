# frozen_string_literal: true

# Base class for controllers
class ApplicationController < ActionController::API
  rescue_from RailsParam::InvalidParameterError do |error|
    render json: { message: error.message }, status: :bad_request
  end
end
