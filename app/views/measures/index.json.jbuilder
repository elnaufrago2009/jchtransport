json.array!(@measures) do |measure|
  json.extract! measure, :id, :nombre, :und
  json.url measure_url(measure, format: :json)
end
