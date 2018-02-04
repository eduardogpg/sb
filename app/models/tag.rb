# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord

  validates :title, presence: true
  
  def self.get_or_create_by_title(title)
    find_or_create_by(title: Tag.title_format(title))
  end

  def self.title_format(title)
    title.strip.downcase
  end
end
