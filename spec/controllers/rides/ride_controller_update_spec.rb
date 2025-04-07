# test/requests/ride/update_spec.rb
require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  login_user

  describe '#update' do
    before do
      user = User.last
      create(:ride, user: user)
    end

    context 'when all parameters are valid' do
      it 'updates the ride' do
        id = Ride.last.id
        put :update, params: { id: , ride: { completed: true } }, as: :json

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)["completed"]).to be true
      end
    end

    context 'when do not find ride' do
      it 'updates the ride' do
        id = 99999
        put :update, params: { id: , ride: { completed: true } }, as: :json

        expect(response).to have_http_status(:not_found)
        expect(response.parsed_body["error"]).to eq("Resource not found.")
      end
    end

    context 'without ride params' do
      it 'returns status code 422' do
        id = Ride.last.id
        put :update, params: { id: }

        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
