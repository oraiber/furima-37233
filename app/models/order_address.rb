class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address1, :building_name, :phone_number, :user_id, :item_id, :order_id
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address1
    validates :phone_number
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end