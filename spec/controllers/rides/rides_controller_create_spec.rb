# test/requests/ride/create_spec.rb
require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  login_user

  let(:endpoint) { '/rides/update_status' }

  describe '#create' do
    context 'when all parameters are valid' do
      let(:params) do
        {
          rider_details: {
            destinationLatitude: '123',
            destinationLongitude: '345',
            originLatitude: '678',
            originLongitude: '912',
            completed: false,
            price: 100
          }
        }
      end
      it 'returns all rides' do
        post :create, params: params, as: :json

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)[ "destinationLatitude"]).to eq(123)
        expect(JSON.parse(response.body)[ "price"]).to eq(100)
        expect(JSON.parse(response.body)["user_id"]).to eq(subject.current_user.id)
      end

      #TODO Create a test when the user is not created. Create validations before..
    end
  end
end
