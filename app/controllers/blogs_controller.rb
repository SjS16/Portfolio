class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status, :toggle_featured]
  before_action :set_topics, only: [:index, :show, :new, :edit, :create]
  before_action :monthly_blogs, only: [:index, :show, :new, :edit, :create]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    @featured = Blog.find_by( featured: 1 )
    @page_title = "Steph Simpson | My Portfolio Blog"
    if logged_in?(:site_admin)
      if params[:topic]
        @topic = Topic.find_by(title: params[:topic])
        @blogs = Blog.recent.where( featured: 0 ).where(topic_id: @topic.id).page(params[:page]).per(3)
      else
        @blogs = Blog.recent.where( featured: 0 ).page(params[:page]).per(3)
      end
    else
      if params[:topic]
        @topic = Topic.find_by(title: params[:topic])
        @blogs = Blog.recent.where( featured: 0 ).where( status: 1 ).where(topic_id: @topic.id).page(params[:page]).per(3)
      elsif params[:month]
        date = Date.parse("1 #{params[:month]}")
        @blogs = Blog.recent.where( featured: 0 ).where( status: 1 ).where(:created_at => date..date.end_of_month).page(params[:page]).per(3)
      else
        @blogs = Blog.recent.where( featured: 0 ).where( status: 1 ).page(params[:page]).per(3)
      end
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = "Steph Simpson | #{@blog.title}"
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice: "You are not authorized to access that page"
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @page_title = "Steph Simpson | New Blog"
  end

  # GET /blogs/1/edit
  def edit
    @page_title = "Steph Simpson | Edit #{@blog.title}"
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    @blog.draft? ? @blog.published! : @blog.draft!
    redirect_to blogs_url, notice: 'Blog status has been updated!'
  end

  def toggle_featured
    if @blog.featured?
      @blog.standard!
    else
      @blog.featured!
      @blog.published!
      @blog.falsify_all_others
    end
    redirect_to blogs_url, notice: 'Featured blog set!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def set_topics
      @topic_nav = Topic.with_blogs.left_joins(:blogs).group(:id).order('COUNT(blogs.id) DESC').limit(7)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status)
    end

    def monthly_blogs
      @blogs_by_month = Blog.all.group_by { |blog| blog.updated_at.strftime("%B %Y") }
    end
end
