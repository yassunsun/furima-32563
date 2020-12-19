class UserBuy

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :house_number, :building, :phone_number, :buy_id

# ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end