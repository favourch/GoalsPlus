json.array!(@settings) do |setting|
  json.extract! setting, :id, :screen_name, :cell_phone, :role, :timezone, :beer, :language
  json.url setting_url(setting, format: :json)
end
