class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  enum featured: { standard: 0, featured: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic

  def falsify_all_others
    Blog.where('id != ?', self.id).update_all("featured = 0")
  end
end
