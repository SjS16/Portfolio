class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :set_topics, only: [:index, :show, :new, :edit, :create]
  before_action :monthly_blogs, only: [:index, :new, :edit]
  layout 'blog'
  access all: [:index], user: [:index], site_admin: :all

  def index
    @topics = Topic.recent.all.page(params[:page]).per(8)
  end

  def new
    @topic = Topic.new
  end

  def edit
    if @topic.blogs.length > 0
      redirect_to topics_path, notice: 'Topic can\'t be changed if it has blogs.'
    end
  end

  def create
    @topic = Topic.new(topic_params)
    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: 'Topic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to topics_path, notice: 'Topic was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    if @topic.blogs.length > 0
      redirect_to topics_path, notice: 'Topic can\'t be deleted if it has blogs.'
    else
      @topic.destroy
      respond_to do |format|
        format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end


  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_topics
    @topic_nav = Topic.with_blogs.left_joins(:blogs).group(:id).order('COUNT(blogs.id) DESC').limit(7)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:title)
  end

  def monthly_blogs
    @blogs_by_month = Blog.all.group_by { |blog| blog.created_at.strftime("%B %Y") }
  end

end
