class PostsController < ApplicationController
   # require Voteable
	def index
    @posts = Post.all
    # @posts = Post.all.sort_by {|x| x.total_votes }.reverse #排序按讚愈多貼文
	end
	 def popular
     @posts=Post.all
    end
	def show
		@post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    # binding.pry
    # post=Post.find(params[:id])
    # post.user = current_user
	end

 def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end
# about Vote
  def vote
    @post = Post.find(params[:id])
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:success] = 'Thanks for voting'
    else
      flash[:error] = "You can only vote for #{@post.title} once!"
    end

    redirect_to :back
  end
private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end


	
end
