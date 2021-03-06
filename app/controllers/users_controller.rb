class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:index]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:captures_attachments).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def liked_posts
    @user = User.find(params[:id])
    @posts = @user.liked_posts.includes(:captures_attachments)
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :avatar)
  end
end
