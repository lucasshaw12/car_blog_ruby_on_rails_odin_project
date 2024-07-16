# frozen_string_literal: true

require "rails_helper"

RSpec.describe AdminDashboardController, type: :controller do
  admin_user = FactoryBot.create(:admin)
  describe "GET #index" do
    context "admin user" do
      before do
        sign_in admin_user
      end
      it "renders the :admin template" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context "non admin user" do
      it "redirects to root route" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
