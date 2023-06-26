require 'rails_helper'

RSpec.describe AdminDashboardController, type: :controller do
  # TODO
  # Only admin can access this page

  admin = FactoryBot.create(:admin)
  before do
    sign_in admin
  end

  describe 'GET #index' do

    context 'admin user' do
      it 'renders the :admin template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

      context 'non admin user' do
        pending
        it 'redirects to root route' do
        end
      end
  end
end