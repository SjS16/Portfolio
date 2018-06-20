class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder
  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.ruby_on_rails
    self.joins(:technologies).where(:technologies => {:name => "Ruby on Rails"})
  end

  def self.by_position
    self.order("position ASC")
  end

  # scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
