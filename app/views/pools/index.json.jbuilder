json.array!(@pools) do |pool|
  json.extract! pool, :game_id, :match_id, :create_time, :sell_statu, :match_result
  json.url pool_url(pool, format: :json)
end