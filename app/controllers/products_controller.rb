class ProductsController < ApplicationController
  before_action :auth_user, except: [:index, :show]
  before_action :verify_is_product_owner, only: [:edit, :update, :destroy]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  private
  def auth_user
    redirect_to new_user_session_path unless user_signed_in?
  end

  private
  def verify_is_product_owner
    if current_user.nil?
      redirect_to new_user_session_path
    elsif product.user != current_user && !current_user.admin?
      redirect_to category_product_url(category, product), :flash => { :error => 'You are not allowed to edit this product.' }
    end
  end
end
