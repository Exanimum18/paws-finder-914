class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @posts = Post.all
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
