class Comment < ActiveRecord::Base
  belongs_to :entry
  has_one :user
end
