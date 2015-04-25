json.array!(@photos) do |photo|
  json.extract! photo, :id, :device_id, :user_id, :image
  json.url photo_url(photo, format: :json)
end
