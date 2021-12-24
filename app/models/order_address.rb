class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address1, :building_name, :phone_number, :user_id, :item_id, :order_id, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address1
    validates :phone_number, format: {with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/, message: " を入力してください"}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: " に(-)をつけて入力してください"}
    validates :token

  end
  validates :prefecture_id, numericality: {other_than: 1, message: " を選択してください"}

  def save
    @order_address = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, building_name: building_name, phone_number: phone_number, order_id: @order_address.id)
  end
end