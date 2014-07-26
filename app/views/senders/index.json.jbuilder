json.array!(@senders) do |sender|
  json.extract! sender, :id, :name_reason, :ruc, :identity_document
  json.url sender_url(sender, format: :json)
end
