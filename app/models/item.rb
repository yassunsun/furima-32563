class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :day_id
    validates :price
    validates :image
  end
end