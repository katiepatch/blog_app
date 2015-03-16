json.array!(@entries) do |entry|
  json.extract! entry, :id, :title, :text, :image, :video
  json.url entry_url(entry, format: :json)
end
