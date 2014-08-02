json.array!(@number_invoices) do |number_invoice|
  json.extract! number_invoice, :id, :number
  json.url number_invoice_url(number_invoice, format: :json)
end
