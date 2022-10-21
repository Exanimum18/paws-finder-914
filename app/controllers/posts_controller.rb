class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
<<<<<<< HEAD
  def index
    @posts = Post.all
=======
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:query].present?
      @posts = Post.search_by_description_and_address_and_title(params[:query])
    else
      @posts = Post.all
    end
>>>>>>> b6678540047b35fcaf39e6a85dc8cab7fdc821de
  end

  def new
    @post = Post.new
    @animal = Animal.all
  end

  def show
    @review = Review.new
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "info_window", locals: {post: post})
      }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :address, :description, :reward, :animal_id, photos: [] )
  end
end
