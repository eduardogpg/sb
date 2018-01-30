# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string(50)
#  description :string(250)
#  real        :boolean
#  color       :string(255)
#  code        :string(255)
#  resource    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Fact < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true

  before_create :set_color
  before_create :set_code

  has_many :fact_tags, dependent: :destroy

  def self.new_by_params(params)
    new(title:params[:title], description:params[:description], resource:params[:resource])
  end
  
  def self.generate_with_tags(fact, tags)
    tags.each { |tag| FactTag.generate_by_fact(fact, tag) } if fact.save
  end

  private
    def generate_code
      SecureRandom.uuid
    end

    def set_code
      self.code = generate_code
    end

    def set_color
      self.color ||= '#' + SecureRandom.hex(3)
    end

end
