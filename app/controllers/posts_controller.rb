class PostsController < ApplicationController
	def index
    @posts = Post.all
	end
	def post
		@posts=Post.all 
	end
	def show
		@post = Post.find(params[:id])
	end
end
