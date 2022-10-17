class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @post = Post.find(params[:post_id])
    @review.post = @post
    if @review.save
      redirect_to post_path(@post)
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  def edit
    set_review
  end

  def update
  end

  def destroy
    set_review
    @review.destroy
    redirect_to post_path(@review.post)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
