class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :photo_url, :photo_description
end
