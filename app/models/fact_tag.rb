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
end
