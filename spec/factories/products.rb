FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price {Faker::Number.decimal(2)}
    released_on {rand(1..90).days.ago}
    category
  end
end
