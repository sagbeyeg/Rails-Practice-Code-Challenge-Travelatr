class BloggersController < ApplicationController
    before_action :set_blogger, only: :show
    
    def index
        @bloggers = Blogger.all 
    end
    
    def new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        redirect_to bloggers_path
    end

    def show
    end

    private

    def set_blogger
      @blogger = Blogger.find(params[:id])
    end

    def blogger_params
      params.permit(:name, :bio, :age)
    end    
end