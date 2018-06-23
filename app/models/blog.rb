class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  enum featured: { standard: 0, featured: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
  validates :body, length: { minimum: 250, maximum: 10000 }

  belongs_to :topic

  has_many :comments, dependent: :destroy

  def falsify_all_others
    Blog.where('id != ?', self.id).update_all("featured = 0")
  end

  def self.recent
    order("created_at DESC")
  end

end
