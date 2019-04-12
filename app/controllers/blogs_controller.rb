class BlogsController < ApplicationController
  def new
    @bolg = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    end
  end

  def index
    @blogs = Blog.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :category, :blog_date)
  end
end
