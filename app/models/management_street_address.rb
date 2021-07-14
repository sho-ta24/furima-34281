class ManagementStreetAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_num , format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :banch 
    validates :city
    validates :phone_num , format: {with: /\A[0-9]{11}\z/}
    validates :item_id
    validates :user_id
  end
  validates :prefecture, numericality: {other_than: 1}
  extend ActiveHash::Associations::ActiveRecordExtensions
  def save

    # 購入者情報を保存
    management = Management.create(user_id: user_id, item_id: item_id)
    # 配送先住所の情報を保存
    StreetAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, phone_num: phone_num, building: building, order_id: order.id)
  end
end
