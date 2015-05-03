json.array!(@series) do |series|
  json.extract! series, :id, :name, :author, :description, :image
  json.url series_url(series, format: :json)
end
