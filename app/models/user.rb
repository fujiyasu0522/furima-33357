class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  # /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/
  # /[a-z\d]{6,}/i
  # # /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/
  # /\A[a-z0-9]+\z/i
  # /[a-z\d]{6,}/i

  with_options presence: true do
    validates :nick_name
    validates :first_name, format: { with: VALID_NAME_REGEX, message: "Full-width characters" }
    validates :last_name, format: { with: VALID_NAME_REGEX, message: "Full-width characters" }
    validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "Full-width katakana characters" }
    validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "Full-width katakana characters" }
    validates :birthday
  end

  validates :password, confirmation: true, format: { with: VALID_PASSWORD_REGEX }
  
  has_many :items
  has_many :purchasers

end
