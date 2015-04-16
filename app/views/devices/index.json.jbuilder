json.array!(@devices) do |device|
  json.extract! device, :id, :category_id, :brand, :brand_type, :serial_number, :inward_config, :external_config, :branch_id, :member, :purpose, :fix, :purchase, :used, :guaranteed, :reject, :status, :face
  json.url device_url(device, format: :json)
end
