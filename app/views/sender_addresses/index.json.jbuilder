json.array!(@sender_addresses) do |sender_address|
  json.extract! sender_address, :id, :direccion, :sender_id
  json.url sender_address_url(sender_address, format: :json)
end
