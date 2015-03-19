# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  image      :string
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ActiveRecord::Base
  belongs_to :blog
  has_many :comments
end
