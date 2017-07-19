FactoryGirl.define do
  factory :category do
    transient do
      num  1
    end
    sequence(:name) { |n| "Category #{n}" }
    # after(:create) {|category| FactoryGirl.create(:product, category_id: category.id)}
    after(:create) do |category, i|
      i.num.times{FactoryGirl.create(:product, category_id: category.id)}
    end
  end
end
