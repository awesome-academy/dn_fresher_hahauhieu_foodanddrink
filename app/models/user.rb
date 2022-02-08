class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy

  enum role: {user: 0, admin: 1}

  validates :password, presence: true,
                    length: {minimum: Settings.length.password}, allow_nil: true
  validates :email, presence: true, uniqueness: true,
    length: {maximum: Settings.length.email},
    format: {with: Settings.format.VALID_EMAIL_REGEX}
end
