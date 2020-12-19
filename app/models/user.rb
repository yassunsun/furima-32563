class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
    validates :last_name_katakana, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
    validates :first_name_katakana, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

end
