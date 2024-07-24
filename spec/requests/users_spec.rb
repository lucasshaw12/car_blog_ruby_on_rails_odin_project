# frozen_string_literal: true

RSpec.describe "/users", type: :request do
  # As you add validations to User, be sure to
  # adjust the attributes here as well.
  user = FactoryBot.create(:user)

  let(:valid_attributes) do
    {
      email: "test@test.com",
      username: "test_username",
      password: "password"
    }
  end

  let(:invalid_attributes) do
    {
      email: "test@test.com",
      username: "test_username",
      password: "password"
    }
  end

  let(:new_attributes) do
    {
      email: "newtestemail@email.com",
      username: "new_test_usernaeme",
      password: "new_password"
    }
  end

  describe "GET #index" do
    it "renders a successful response" do
      debugger
      get users_path
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      get user_path(user)
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "renders a successful response" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "renders a successful response" do
      get edit_user_path(user)
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) do
        expect(user.email).to eq "newtestemail@email.com"
      end

      it "updates the requested user" do
        patch user_path(user), params: {user: new_attributes}
        user.reload
        expect(user.email).to eq "newtestemail@email.com"
      end

      it "redirects to the user" do
        patch user_path(user), params: {user: new_attributes}
        user.reload
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch user_path(user), params: {user: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      expect do
        delete user_path(user)
      end.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete user_path(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
