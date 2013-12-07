json.array!(@areas) do |area|
  json.extract! area, :id, :title, :pid
  json.url area_url(area, format: :json)
end