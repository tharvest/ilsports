json.array!(@games) do |game|
  json.extract! game, :game_id, :game_name
  json.url game_url(game, format: :json)
end