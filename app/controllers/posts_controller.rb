class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @posts = Post.search_by_description_and_address_and_title(params[:query])
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.animal_id = 1
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:address, :description, :photos)
  end
end
