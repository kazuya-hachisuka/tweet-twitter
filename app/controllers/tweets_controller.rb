class TweetsController < ApplicationController
  def index
  	@tweets = Tweet.all
  end

  def show
  end

  def edit
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
  end

 private
 	def tweet_params
 		params.require(:tweet).permit(:title, :content, :image)
 	end
end
