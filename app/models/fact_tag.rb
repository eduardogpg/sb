# == Schema Information
#
# Table name: fact_tags
#
#  id         :integer          not null, primary key
#  fact_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FactTag < ApplicationRecord
  belongs_to :fact
  belongs_to :tag

  validates :fact, presence: true
  validates :tag, presence: true

  def self.create_by_fact_tags(fact, tag)
    find_or_create_by(fact: fact, tag:tag)
  end
end
