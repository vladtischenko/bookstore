json.array!(@books) do |book|
  json.extract! book, :id, :title, :short_description, :description, :picture, :in_stock, :price
  json.url book_url(book, format: :json)
end
