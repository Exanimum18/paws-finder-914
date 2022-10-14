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
    set_post
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
    set_post
  end

  def update
    set_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_post
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:address, :description, :reward, :animal_id, photos: [] )
  end
end
