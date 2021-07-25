FactoryBot.define do
  factory :management_street_address do

    user_id          {2}
    item_id          {2}
    postal_code      {'111-1111'}
    prefecture_id    {2}
    city             {'横浜'}
    address          {'1-11-1'}
    phone_number     {'09012341234'}
    building         {'test'}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
