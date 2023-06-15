require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  user = FactoryBot.create(:user)
  user.confirm

  describe '#Article' do
    before do
      sign_in user
    end
    context 'with valid params' do
      let(:article) { create :article }

      let(:params) {
        {
          article: {
            title: 'New article title',
            body: 'New article body',
            status: 'public',
            created_at: Time.now,
            updated_at: Time.now,
            user:
          }
        }
      }

      it 'creates an article' do
        expect { post :create, params: }.to change { Article.count }.by(1)
        expect(response).to have_http_status(302)
      end
    end

    context 'invalid params' do
    end
  end
end