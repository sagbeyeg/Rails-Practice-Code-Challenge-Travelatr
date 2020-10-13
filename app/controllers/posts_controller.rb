class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]
    
    def index
        @posts = Post.all 
    end
    
    def new
      @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        redirect_to posts_path
    end

    def update
        @post.likes += 1 # our new posts aren't getting created with a likes attribute so the like button doesn't work for thrm
        @post.save
        redirect_to post_path(@post)
    end
    
    def show
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
        #{"utf8"=>"✓", "authenticity_token"=>"zQPnyweUJMlkopXM7sxVs6TnVX/oV/zg1eLO9hln5EuKKR7nJDNl6WdkyZALGA3IVEic4xC6+6TtASzIAZw5tg==", 
        #"post"=>{"title"=>"Done", "content"=>"vcegiayvc; viuwgrv; abe iebv ieb", "blogger_id"=>"1", "destination_id"=>"1"}, "commit"=>"Submit Post"}
      params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
    end    
end