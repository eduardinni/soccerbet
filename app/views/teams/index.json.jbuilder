json.array!(@teams) do |team|
  json.extract! team, :id, :name, :image
  json.url team_url(team, format: :json)
end
