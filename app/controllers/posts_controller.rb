class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @posts = Post.search_by_description_and_address_and_title(params[:query])
    else
      @posts = Post.all
    end

  end

  def new
    @post = Post.new
    @animal = Animal.all
  end

  def show
    @review = Review.new
    @posts = Post.all
    @markers = @posts.geocoded.map do |post|
      {
         lat: post.latitude,
         lng: post.longitude,
         info_window: render_to_string(partial: "info_window", locals: {post: post}),
         image_url: helpers.asset_url("logo.png")
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

  def mis_publicaciones
    @posts = Post.where(user_id: current_user.id)
    @review = Review.new
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :address, :description, :reward, :animal_id, photos: [] )
  end
end
