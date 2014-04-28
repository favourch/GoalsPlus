json.array!(@stadia) do |stadium|
  json.extract! stadium, :id, :name, :city, :capacity
  json.url stadium_url(stadium, format: :json)
end
