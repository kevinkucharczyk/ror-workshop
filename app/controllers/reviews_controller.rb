class ReviewsController < ApplicationController
  before_action :auth_user
  before_action :verify_rights, only: [:edit, :destroy]

  expose(:category)
  expose(:review)
  expose(:product)

  def new
  end

  def edit
  end

  def create
    self.review = Review.new(review_params)
    self.review.user = current_user

    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end

  private
    def auth_user
      redirect_to new_user_session_path unless user_signed_in?
    end

  private
    def verify_rights
      if current_user.nil?
        redirect_to new_user_session_path
      elsif review.user != current_user && !current_user.admin?
        redirect_to category_product_url(category, product), :flash => { :error => 'You are not allowed to edit this review.' }
      end
    end
end
