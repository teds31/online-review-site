class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @wines = Product.all
  end

  def show
    @wine = Product.find(params[:id])
    @reviews = @wine.reviews
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

  def edit
    @wine = Product.find(params[:id])
  end

  def update
    @wine = Product.find(params[:id])
    @wine.update(wine_params)
    flash[:success] = "Wine saved!"
    redirect_to @wine
  end

  def destroy
    @wine = Product.find(params[:id])
    @wine.destroy
    flash[:success] = "Wine has been removed."
    redirect_to products_path
  end

  private

    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, notice: "Please Login to view that page!"
      end
    end

    def wine_params
      params.require(:product).permit(:name, :maker, :location, :year).merge(user: current_user)
    end

end
