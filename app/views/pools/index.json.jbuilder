json.array!(@pools) do |pool|
  json.extract! pool, :id, :name, :active
  json.url pool_url(pool, format: :json)
end
