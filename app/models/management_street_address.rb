class ManagementStreetAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :address
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  def save
    # 購入者情報を保存
    management = Management.create(user_id: user_id, item_id: item_id)
    # 配送先住所の情報を保存
    StreetAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                         phone_number: phone_number, building: building, management_id: management.id)
  end
end
