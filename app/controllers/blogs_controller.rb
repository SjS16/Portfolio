class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status, :toggle_featured]
  before_action :set_topics, only: [:index, :show, :new, :edit, :create]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    @featured = Blog.find_by( featured: 1 )
    @page_title = "Steph Simpson | My Portfolio Blog"
    if params[:topic]
      @topic = Topic.find_by(title: params[:topic])
      @blogs = Blog.where( featured: 0 ).where(topic_id: @topic.id).page(params[:page]).per(3)
    else
      @blogs = Blog.where( featured: 0 ).page(params[:page]).per(3)
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
    @page_title = "Steph Simpson | #{@blog.title}"
    @seo_keywords = @blog.body
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
      @topics = Topic.all.limit(12)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id)
    end
end
