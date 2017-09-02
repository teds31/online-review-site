class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @wines = Product.all
  end

  def show
    @wine = Product.find(params[:id])
  end

  def new
    @wine = Product.new
  end

  def create
    @wine = Product.new(wine_params)
    if @wine.save
      redirect_to @wine
      flash[:success] = "Wine added!"
    else
      flash[:notice] = "Error. All forms must be valid. Please edit and try again."
      render :new
    end
  end

  private

    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session, notice: "Please Login to view that page!"
      end
    end

    def wine_params
      params.require(:product).permit(:name, :maker, :location, :year).merge(user: current_user)
    end

end
