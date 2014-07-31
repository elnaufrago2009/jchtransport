json.array!(@number_guides) do |number_guide|
  json.extract! number_guide, :id, :numero
  json.url number_guide_url(number_guide, format: :json)
end
