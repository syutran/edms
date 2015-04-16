json.array!(@device_images) do |device_image|
  json.extract! device_image, :id, :device_id
  json.url device_image_url(device_image, format: :json)
end
