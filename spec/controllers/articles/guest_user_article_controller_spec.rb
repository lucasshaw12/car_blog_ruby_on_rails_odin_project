require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  user = FactoryBot.create(:user)

  describe '"Guest" user' do

    describe 'GET #show' do
      let(:article) { FactoryBot.create(:article) }

      it 'renders :show template' do
        get :show, params: { id: article.id }
        expect(:article).to render_template(:show)
      end

      it 'assigns requested article to @article' do
        get :show, params: { id: article.id }
        expect(assigns(:article)).to eq(article)
      end
    end

    describe 'GET #index' do
      it 'renders :index template' do
        get :index
        expect(response).to render_template(:index)
        expect(response).to have_http_status(200)
      end

      it 'assigns articles to template' do
        get :index
        expect(assigns(:articles)).to match_array(Article.all)
      end
    end

    describe 'GET #new' do
      it 'redirects to :sign_in template' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST #create' do
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

      it 'redirects to :sign_in template' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do
      let(:article) { FactoryBot.create(:article) }

      it 'redirects to :sign_in template' do
        get :edit, params: { id: article.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PUT #update' do
      let(:article) { FactoryBot.create(:article) }
      let(:params) { FactoryBot.attributes_for(:article, title: 'new title') }

      it 'redirects to :sign_in template' do
        put :update, params: { id: article.id, article: params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'DELETE #destroy' do
      let(:article) { FactoryBot.create(:article) }

      it 'redirects to :sign_in template' do
        delete :destroy, params: { id: article.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end