# test/requests/ride/index_spec.rb
require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  login_user

  let(:endpoint) { '/rides' }

  before do
    user = User.create!(email: 'teste123@gmail.com', password: '123456', password_confirmation: '123456')
    Ride.create!(user: user, destination: 'Destino Exemplo', origin: 'Origem Exemplo', completed: false, price: 100)
  end

  describe '#rides' do
    context 'when there are existing rides in the database' do
      it 'returns all rides' do
        get endpoint

        expect(response).to have_http_status(:ok)
        expect(json['rides'].count).to eq(1)
      end
    end
  end
  end
