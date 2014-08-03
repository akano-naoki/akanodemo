class TweetMongo
  include Mongoid::Document
  field: :id_str, type: String
  field: :screen_name, type: String
  field: :profile_image_url, type: String
  field: :text, type: String
  field: :created_at, type: DateTime

end
