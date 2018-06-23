module BlogsHelper

  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end

  def set_status blog
    if blog.status == "published"
      link_to "Set to Draft", toggle_status_blog_path(blog)
    else
      link_to "Set to Published", toggle_status_blog_path(blog)
    end
  end

  def set_featured blog
    if blog.featured == "standard"
      link_to "Set as Featured Blog", toggle_featured_blog_path(blog)
    else
      link_to "Set to Standard Blog", toggle_featured_blog_path(blog)
    end
  end
end
