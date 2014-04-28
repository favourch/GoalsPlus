json.array!(@countries) do |country|
  json.extract! country, :id, :name, :code, :continent
  json.url country_url(country, format: :json)
end
