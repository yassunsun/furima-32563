class UserBuy

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: "Input only number"}
  end

  # 各テーブルにデータを保存する処理を書く
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, buy_id: buy_id)
  end

end