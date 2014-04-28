json.array!(@teams) do |team|
  json.extract! team, :id, :name, :short, :stadium, :national, :rating
  json.url team_url(team, format: :json)
end
