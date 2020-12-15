class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :title
    validates :explanation
    validates :price
  end

  validates :price      ,numericality: { only_integer: true, message: 'Half-width number' }
  validates :price      ,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
  validates :category   ,numericality: { other_than: 1, message: 'Select' }
  validates :condition  ,numericality: { other_than: 1, message: 'Select' }
  validates :fee        ,numericality: { other_than: 1, message: 'Select' }
  validates :prefecture ,numericality: { other_than: 1, message: 'Select' }
  validates :day        ,numericality: { other_than: 1, message: 'Select' }

end