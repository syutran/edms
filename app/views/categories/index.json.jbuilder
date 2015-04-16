json.array!(@categories) do |category|
  json.extract! category, :id, :name, :explain, :level, :parent_id, :branch_id
  json.url category_url(category, format: :json)
end
