FactoryBot.define do
  factory :item do
    association :user

    name                       { '商品名' }
    info                       { '商品説明' }
    category_id                { 2 }
    sales_status_id            { 2 }
    shipping_free_status_id    { 2 }
    prefecture_id              { 2 }
    scheduled_delivery_id      { 2 }
    price                      { 301 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
