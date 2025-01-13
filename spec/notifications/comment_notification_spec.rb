RSpec.describe CommentNotification, type: :notification do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user:) }
  let(:comment) { create(:comment, article:) }

  let(:notification) do
    CommentNotification.with(comment: { id: comment.id, article_id: article.id })
  end

  describe '#message' do
    context 'when user has a username' do
      it 'returns the correct notification message' do
        expect(notification.message).to eq(
          "#{comment.user.username} commented on #{article.title.truncate(15)}"
        )
      end
    end

    context 'when user does not have a username' do
      let(:user) { FactoryBot.create(:user, username: nil) }
      let(:comment) { create(:comment, article:, user:) }

      it 'returns the correct notification message' do
        expect(notification.message).to eq(
          "#{comment.user.email} commented on #{article.title.truncate(15)}"
        )
      end
    end
  end

  describe '#url' do
    it 'returns the correct article path' do
      expect(notification.url).to eq(Rails.application.routes.url_helpers.article_path(article))
    end
  end

  describe 'delivery methods' do
    it 'delivers via database' do
      expect { notification.deliver(user) }.to change(Notification, :count).by(1)
    end
  end
end
