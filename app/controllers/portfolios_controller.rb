class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :ruby_on_rails], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    head :ok
  end

  def ruby_on_rails
    @ruby_portfolio_items = Portfolio.ruby_on_rails
  end

  def new
    @portfolio_item = Portfolio.new
    @portfolio_item.technologies.build
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item.technologies.build
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolio_show_path(@portfolio_item), notice: 'Portoflio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    #Destroy the record
    @portfolio_item.destroy
    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy]
                                     )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
