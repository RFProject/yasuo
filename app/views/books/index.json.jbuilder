json.array!(@books) do |book|
  json.extract! book, :id, :turn, :released_at, :description, :image, :series_id, :amazon_url
  json.url book_url(book, format: :json)
end
