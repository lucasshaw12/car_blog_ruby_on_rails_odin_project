require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    context 'when logged in as admin user' do
      user = FactoryBot.create(:admin)

      it 'gets list of all users' do
        get users_index_path
        expect(response).to have_http_status(:successful)
        expect(response.body).to include(user.email)
      end
    end

    context 'when logged in as guest user' do
      pending 'redirects to the home page' do
      end
    end

    context 'when logged in as basic user' do
      pending 'redirects to the home page' do
      end
    end
  end
end
