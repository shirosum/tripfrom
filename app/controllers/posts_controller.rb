class PostsController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create, :show, :edit, :update, :hashtag]
    before_action :authenticate_correct_user, only:[:edit, :update]

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            render :success
        else
            render :error
        end
    end

    def index
        if user_signed_in?
            @user = current_user
            @userf = @user.followings.with_attached_avatar.page(params[:page]).per(16).reverse_order
        end
        @q = Post.with_attached_captures.includes(:captures_attachments, :user, :nation, :likes).ransack(params[:q])
        @result = @q.result.page(params[:page]).per(16).reverse_order()
        @like = Like.new
        @post = Post.new
    end

    def show
        @like = Like.new()
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comments = @post.comments
        @latestposts = @post.user.posts.last(3)
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post_update
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def hashtag
        if user_signed_in?
            @user = current_user
            @userf = @user.followings.page(params[:page]).per(16).reverse_order
        end
        tag = Tag.find_by(name: params[:name])
        @posts = tag.posts.page(params[:page]).per(16).reverse_order
        @like = Like.new
        @post = Post.new
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to user_path(current_user.id)
        end
    end

    private
    def post_params
        params.require(:post).permit(:user_id, :nation_id, :naiton_name, :caption, captures: [])
    end

end
