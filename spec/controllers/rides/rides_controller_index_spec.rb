# test/requests/ride/index_spec.rb
require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  login_user

  let(:endpoint) { '/rides' }

  describe '#rides' do
    context 'when there are existing rides in the database' do
      before do
        user = User.create!(email: 'teste123@gmail.com', password: '123456', password_confirmation: '123456')
        create(:ride, user: user)
      end

      it 'returns all rides' do
        get :index

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body).size).to eq(1)
      end
    end

    context 'when there are no rides in the database' do
      it 'returns an empty array' do
        get :index

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq([])
      end
    end
  end
  end
