json.array!(@flames) do |flame|
  json.extract! flame, :id, :name, :description
  json.url flame_url(flame, format: :json)
end
