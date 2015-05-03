json.array!(@reads) do |read|
  json.extract! read, :id, :user_id, :book_id
  json.url read_url(read, format: :json)
end
