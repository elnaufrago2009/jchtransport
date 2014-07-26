json.array!(@addressees) do |addressee|
  json.extract! addressee, :id, :name_reason, :ruc, :identity_document
  json.url addressee_url(addressee, format: :json)
end
