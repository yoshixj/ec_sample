class Api::V1::ProductsController < Api::ApplicationController

  def index
    @products = Product.all
    render json: @products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to :products
    else
      render plain: "Bad"
    end
  end

  def show
    #code
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to :product
    else
      redirect_to :new_product ,alert: 'save　fail...'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name,:price, :shop_id,:image)
  end

end
