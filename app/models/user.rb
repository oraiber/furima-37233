class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で設定してください'}
  validates :nickname,          presence: true
  validates :first_name,        presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'には全角文字を使用してください' }
  validates :family_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'には全角文字を使用してください' }
  validates :first_name_kana,   presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'にはカタカナを使用してください' }
  validates :family_name_kana,  presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'にはカタカナを使用してください' }
  validates :birth_day,         presence: true
end
