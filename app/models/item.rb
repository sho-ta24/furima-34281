class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    ith_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_free_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { in: 300..9_999_999 }
  end
  has_one_attached :image
  belongs_to :user
end
