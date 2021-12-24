class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :days

  validates :item_name,          presence: true
  validates :text,               presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 , message: " を選択してください"} 
  validates :item_condition_id,  presence: true, numericality: { other_than: 1 , message: " を選択してください"} 
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 , message: " を選択してください"}
  validates :area_id,            presence: true, numericality: { other_than: 1 , message: " を選択してください"}
  validates :days_id,            presence: true, numericality: { other_than: 1 , message: " を選択してください"}
  validates :price,              presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,              presence: true

  def was_attached?
    self.image.attached?
  end
end
