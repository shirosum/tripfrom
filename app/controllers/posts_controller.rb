class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save!
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def index
        @like = Like.new
        @q = Post.ransack(params[:q])
        @result = @q.result.page(params[:page]).per(12).reverse_order
    end

    def show
        @like = Like.new
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comments = @post.comments
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
        tag = Tag.find_by(name: params[:name])
        @posts = tag.posts.page(params[:page]).per(9).reverse_order
    end


    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to posts_path
        end
    end

    private
    def post_params
        params.require(:post).permit(:nation_id, :caption, captures: [])
    end

end
