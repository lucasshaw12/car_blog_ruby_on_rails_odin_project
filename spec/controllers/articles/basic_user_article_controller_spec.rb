require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  basic = FactoryBot.create(:basic)
  before do
    sign_in basic
  end

  describe '"Basic" user' do
    describe 'GET #new' do
      it 'renders :new template' do
        get :new
        expect(response).to render_template(:new)
      end

      it 'assigns new Article to @article' do
        get :new
        expect(assigns(:article)).to be_a_new(Article)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        let(:params) do
          {
            article: {
              title: 'New article title',
              body: 'New article body',
              status: 'public',
              created_at: Time.now,
              updated_at: Time.now,
              basic:
            }
          }
        end
        it 'creates an article' do
          expect { post :create, params: }.to change { Article.count }.by(1)
        end

        it 'redirects to article :show template' do
          post(:create, params:)
          expect(response).to redirect_to(article_path(assigns[:article]))
          expect(response).to have_http_status(302)
        end
      end

      context 'with invalid params' do
        let(:params) do
          {
            article: {
              title: '',
              body: 'New article body',
              status: 'public',
              created_at: Time.now,
              updated_at: Time.now,
              basic:
            }
          }
        end
        it 'does not create an article' do
          expect { post :create, params: }.to change { Article.count }.by(0)
        end

        it 'renders :new template' do
          post(:create, params:)
          expect(response).to render_template(:new)
          expect(response).to have_http_status(422)
        end
      end
    end

    describe 'GET #edit' do
      let(:article) { FactoryBot.create(:article) }

      it 'renders :edit template' do
        get :edit, params: { id: article.id }
        expect(response).to render_template(:edit)
      end

      it 'assigns the article to @article' do
        get :edit, params: { id: article.id }
        expect(assigns(:article)).to eq(article)
      end
    end

    describe 'PUT #update' do
      let(:article) { FactoryBot.create(:article) }

      context 'with valid params' do
        let(:params) { FactoryBot.attributes_for(:article, title: 'new title') }

        it 'renders :show template' do
          put :update, params: { id: article.id, article: params }
          expect(response).to redirect_to(article)
        end

        it 'update article value' do
          put :update, params: { id: article.id, article: params }
          article.reload
          expect(article.title).to eq('new title')
        end
      end

      context 'with invalid params' do
        let(:params) { FactoryBot.attributes_for(:article, title: ' ', body: 'new body text') }

        it 'renders :edit template' do
          put :update, params: { id: article.id, article: params }
          expect(response).to render_template(:edit)
        end

        it 'does not update article value' do
          put :update, params: { id: article.id, article: params }
          article.reload
          expect(article.title).to_not eq(' ')
        end
      end
    end

    describe 'DELETE #destroy' do
      let(:article) { FactoryBot.create(:article) }

      it 'redirects to :index template' do
        delete :destroy, params: { id: article.id }
        expect(response).to redirect_to(articles_path)
      end

      it 'deletes article' do
        delete :destroy, params: { id: article.id }
        expect(Article.exists?(article.id)).to be_falsey
      end
    end
  end
end
