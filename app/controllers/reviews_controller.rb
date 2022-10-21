class ReviewsController < ApplicationController
  before_action :set_post, only: :update
  before_action :set_review, only: [:update, :destroy]

  def create
    @review = Review.new(review_params)
    @post = Post.find(params[:post_id])
    @review.post = @post
    @review.user = current_user
    if @review.save
      redirect_to post_path(@post)
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to post_path(@review.post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to post_path(@review.post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
