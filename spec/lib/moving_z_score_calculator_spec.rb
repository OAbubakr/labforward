require 'rails_helper'

RSpec.describe MovingZScoreCalculator do
  let(:subject) { MovingZScoreCalculator.new(args).perform }
  it_behaves_like 'zscore calculator', :moving_z_score
end
