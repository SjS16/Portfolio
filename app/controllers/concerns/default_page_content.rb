module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Steph Simpson | My Portfolio Website"
    @seo_keywords = "Steph Simpson portfolio blog web developer ruby rails"
  end

end