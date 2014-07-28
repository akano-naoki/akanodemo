class TweetMongo
  include Mongoid::Document
  field: :id_str, String
  field: :screen_name, String
  field: :profile_image_url, String
  field: :text, String
  field: :created_at, DateTime

end
