# frozen_string_literal: true

# User model validations are normally covered in Devise, however adding them in anyway for coverage of #create
RSpec.describe User do
  let(:user) { create :user }
  let(:errors) { user.errors.messages }

  describe '#create' do
    context 'with all values present' do
      it 'creates a new user' do
        expect(user).to be_valid
      end
    end

    context 'with values missing' do
      it 'raises an error when email is missing' do
        user.email = ''
        expect(user).not_to be_valid
      end

      it 'raises an error with password missing' do
        user.password = ''
        expect(user).not_to be_valid
        expect(errors[:password]).to include "can't be blank"
      end

      it 'raises an error with password and confirmation not matching' do
        user.password = 'pass'
        user.password_confirmation = 'diffpass'
        expect(user).not_to be_valid
        expect(errors[:password_confirmation]).to include "doesn't match Password"
      end
    end
  end
end
