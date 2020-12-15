class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :fee, :prefecture, :day

  with_options presence: true do
    validates :image
    validates :title
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :day_id
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 }
end