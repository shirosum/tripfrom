class BlogsController < ApplicationController
  def new
    @bolg = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user.id = current_user.id
    if @blog.save
      redirect_to blogs_path
    end
  end

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(bolg.id)
    end
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :category_id, images: [])
  end
end
