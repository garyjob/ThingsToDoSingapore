json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :description
  json.url attraction_url(attraction, format: :json)
end
