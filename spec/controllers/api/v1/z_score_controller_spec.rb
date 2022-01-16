require 'rails_helper'

RSpec.describe Api::V1::ZScoreController, type: :controller  do
  describe "GET moving_z_score" do
    context 'invalid params' do
      invalid_params = [
        {},
        { threshold: 1 },
        { data: [1]},
        { data: [], threshold: 1},
        { data: ['a'], threshold: 1},
        { data: [1], threshold: 'a'},
      ]
      invalid_params.each do |invalid_param|
        it "should return bad request for params #{invalid_param}" do
          get :moving_z_score, params: invalid_param
          expect(response).to have_http_status :bad_request
        end
      end
    end

    context 'valid params' do
      it 'should return successful response' do
        get :moving_z_score, params: { threshold: 1, data: [1] }
        expect(response).to be_successful
      end
    end
  end

  describe "GET z_score" do
    context 'valid params' do
      it 'should return successful response' do
        get :z_score, params: { threshold: 1, data: [1] }
        expect(response).to be_successful
      end
    end
  end
end
