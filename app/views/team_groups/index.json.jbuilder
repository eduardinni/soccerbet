json.array!(@team_groups) do |team_group|
  json.extract! team_group, :id, :name
  json.url team_group_url(team_group, format: :json)
end
