json.array!(@matches) do |match|
  json.extract! match, :id, :host, :visitor, :stadium, :tournament, :stage, :date, :timezone, :pens, :goals_a, :goals_b, :pens_a, :pens_b, :coof_a, :coof_x, :coof_b
  json.url match_url(match, format: :json)
end
