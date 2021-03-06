class NormalPostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :image, :image_cache_id, :document, :document_cache_id))

    if @post.save
      redirect_to [:normal, @post]
    else
      render :new
    end
  end
end
