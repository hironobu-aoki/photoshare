json.extract! photo, :id, :user, :image, :photo_comment, :created_at, :updated_at
json.url photo_url(photo, format: :json)
