json.array!(@matches) do |match|
  json.extract! match, :match_id, :player_a, :player_b, :start_time, :end_time, :operator
  json.url match_url(match, format: :json)
end