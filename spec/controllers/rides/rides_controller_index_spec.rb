# test/requests/ride/index_spec.rb
require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  login_user

  let(:endpoint) { '/rides' }

  describe '#index' do
    context 'when there are existing rides in the database' do
      before do
        user = User.last
        create(:ride, user: user)
      end

      it 'returns all rides' do
        expected_user_email = User.last.email
        get :index

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)["total_rides"]).to eq(1)
        expect(JSON.parse(response.body)["user_email"]).to eq(expected_user_email)
      end
    end

    context 'when there are others users with rides in the database' do
      before do
        user = User.last
        create(:ride, user: user)

        user2 = create(:user)
        create(:ride, user: user2)
      end

      it 'returns only the rides of the current user' do
        get :index

        expect(JSON.parse(response.body)["total_rides"]).to eq(1)
      end
    end

    context 'when there are no rides in the database' do
      it 'returns an empty array' do
        get :index

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)["total_rides"]).to eq(0)
      end
      end
    end
  end
