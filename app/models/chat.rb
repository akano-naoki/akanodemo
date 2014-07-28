class Chat
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :comment, type: String
  field :created_date, type: String

  index({created_date: 1}, {expire_after_seconds: 30.days})

  before_save :set_created_date
  before_create :set_created_date

  def set_created_date
    self.created_date ||= Date.today.strftime("%Y%m%d")
  end
end
