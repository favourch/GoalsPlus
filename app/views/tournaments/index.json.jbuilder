json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :short, :national, :club, :rating
  json.url tournament_url(tournament, format: :json)
end
