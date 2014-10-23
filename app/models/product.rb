class Product < ActiveRecord::Base
  belongs_to :user

  def to_param
    "#{id}-#{self.title.gsub(' ', '-')}"
  end
end
