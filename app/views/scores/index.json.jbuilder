json.array!(@scores) do |score|
  json.extract! score, :id, :name, :points
end
