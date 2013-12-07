json.array!(@activities) do |activity|
  json.extract! activity, :title, :starttime, :endtime, :quota, :signed, :place, :organizer, :contact, :description, :other
  json.url activity_url(activity, format: :json)
end