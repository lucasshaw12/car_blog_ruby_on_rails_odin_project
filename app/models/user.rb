class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :avatar
  has_many :articles
  has_many :comments
  has_many :notifications, as: :recipient, dependent: :destroy
  validates :validate_image_file_type, presence: true

  def create
    # Create the user form params
    @user = User.new(user_params)
    if @user.save
      # Send the email
      UserNotifierMailer.send_signup_email(@user).deliver
      redirect_to(@user, notice: 'User created')
    else
      render action: 'new'
    end
  end

  def validate_image_file_type
    if avatar.attached? && !avatar.content_type.in?(%w[image/jpeg image/png image/jpg])
      errors.add(:avatar, 'must be JPEG or PNG')
    end
  end

  def resize_image
    avatar.variant(resize_to_limit: [200, 200])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :login)
  end

  # set user privileges within console using:
  # @user = User.first
  # @user.role = 1 # moderator
  # @user.save
  enum role: %i[user moderator admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['username']
  end
end
