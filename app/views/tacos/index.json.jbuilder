json.array!(@tacos) do |taco|
  json.extract! taco, :id, :name, :flame_id
  json.url taco_url(taco, format: :json)
end
