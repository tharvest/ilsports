json.array!(@catalogs) do |catalog|
  json.extract! catalog, :name
  json.url catalog_url(catalog, format: :json)
end