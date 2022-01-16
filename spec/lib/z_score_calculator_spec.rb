require 'rails_helper'

RSpec.describe ZScoreCalculator do
  let(:subject) { ZScoreCalculator.new(args).perform }
  it_behaves_like 'zscore calculator', :z_score
end
