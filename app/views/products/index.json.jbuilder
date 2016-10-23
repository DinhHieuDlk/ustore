json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :description, :user_id, :category_id
  json.url product_url(product, format: :json)
end
