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
  
  def self.get_or_create_tags_by_string(string)
    string.split(',').map { |title| Tag.get_or_create_by_title(title) }.compact
  end

  def self.get_or_create_by_title(title)
    where(title: Tag.title_format(title)).first_or_create
  end

  def self.title_format(title)
    title.strip.downcase
  end

end
