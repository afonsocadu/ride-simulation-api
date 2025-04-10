# test/requests/ride/create_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  describe '#delete' do
    context 'when the user exists' do
      it 'does not destroy the user' do
        user = User.last
        delete :destroy, params: { id: @user.id }

        expect(User.all.size).to be(0)
      end

      it 'returns a success response' do
        user = User.last
        delete :destroy, params: { id: user.id }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user does not exist' do
      it 'does not destroy the user' do
        delete :destroy, params: { id: 9999 }

        expect(User.all.size).to be(1)
      end

      it 'returns a not found response' do
        delete :destroy, params: { id: 9999 }

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
