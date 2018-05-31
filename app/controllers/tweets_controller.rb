class TweetsController < ApplicationController
  def index
  	@tweets = Tweet.all.order('updated_at DESC')
  end

  def show
  	@tweet = Tweet.find(params[:id])
  	@user = User.all
    @post_comment = PostComment.new
  end

  def edit
  	@tweet = Tweet.find(params[:id])
  end

  def update
  	@tweet = Tweet.find(params[:id])
  	flash[:notice] = "Tweet was successfully Updated!!"
  	@tweet.update(tweet_params)
  	redirect_to tweets_path
  end

  def new
  	@tweet = Tweet.new
  end

  def create
  	tweet = Tweet.new(tweet_params)
  	tweet.user_id = current_user.id
  	tweet.save
  	redirect_to tweets_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

 private
 	def tweet_params
 		params.require(:tweet).permit(:title, :content, :image)
 	end
end

