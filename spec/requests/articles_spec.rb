# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  admin_user = FactoryBot.create(:admin)
  guest_user = FactoryBot.create(:guest)
  basic_user = FactoryBot.create(:basic)

  describe '#home' do
    context 'admin user' do
      before do
        sign_in admin_user
      end
      it 'renders the users home page' do
        get root_path
        expect(response).to have_http_status(:successful)
      end
    end
    context 'basic user' do
      before do
        sign_in basic_user
      end
      it 'renders the users home page' do
        get root_path
        expect(response).to have_http_status(:successful)
      end
    end
    context 'guest user' do
      before do
        sign_in guest_user
      end
      it 'renders the users home page' do
        get root_path
        expect(response).to have_http_status(:successful)
      end
    end

    context 'no user signed in' do
      it 'redirects to the sign in page' do
        get root_path
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
