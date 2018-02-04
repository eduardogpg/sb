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

  include Dateable

  attr_accessor :labels

  validates :labels, presence: true
  validates :title, presence: true
  validates :description, presence: true

  before_create :set_color
  before_create :set_code
  after_save :create_fact_tags

  has_many :fact_tags, dependent: :destroy
  has_many :tags, through: :fact_tags, source: :tag

  def labels_format
    (tags.any?) ? tags_format : ''
  end

  def tags_format(str='', prefix=',')
    tags.each { |tag| str = str + " " + tag.title + prefix }
    str.strip[0..-2]
  end

  private
    def create_fact_tags
      labels.split(',').each { |tag| create_fact_tag(tag) } #Label is a attr_accessor
    end

    def create_fact_tag(tag='')
      FactTag.create_by_fact_tags(self, Tag.get_or_create_by_title(tag))
    end

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
