json.array!(@guesses) do |guess|
  json.extract! guess, :id, :user, :match, :goals_a, :goals_b, :pens_a, :pens_b, :points
  json.url guess_url(guess, format: :json)
end
