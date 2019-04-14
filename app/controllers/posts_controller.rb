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
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
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

    def destroy
    end

    private
    def post_params
        params.require(:post).permit(:nation_id, :caption, captures: [])
    end

end
