json.array!(@continents) do |continent|
  json.extract! continent, :id, :name, :code, :federation
  json.url continent_url(continent, format: :json)
end
