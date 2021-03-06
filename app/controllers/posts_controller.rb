class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
     @post = current_user.posts.build(post_params)
     if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to root_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    if @post.destroy
    redirect_to root_path
   end
  end


  private

	def post_params
	  params.require(:post).permit(:image, :title)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
