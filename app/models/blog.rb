# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :entries
end
