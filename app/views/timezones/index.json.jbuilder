json.array!(@timezones) do |timezone|
  json.extract! timezone, :id, :name, :tzinfo, :utc
  json.url timezone_url(timezone, format: :json)
end
