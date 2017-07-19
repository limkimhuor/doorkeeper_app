class Product < ApplicationRecord
  PRODUCT_PARAMS = [:name, :price, :released_on, :category_id]
  belongs_to :category
end
