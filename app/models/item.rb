class Item < ApplicationRecord   
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1 } 
    validates :sales_status_id, numericality: { other_than: 1 } 
    validates :shipping_free_status_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :scheduled_delivery_id, numericality: { other_than: 1 } 
    validates :price, format:{ with:/\A[0-9]+\z/}, numericality: { in: 300..9_999_999 }
  end
  has_one_attached :image
  belongs_to :user



end