class PostCommentsController < ApplicationController
	def create
		tweet = Tweet.find(params[:tweet_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.tweet_id = tweet.id
		comment.save
		redirect_to tweets_path
	end

	def destroy
		tweet = Tweet.find(params[:tweet_id])
		comment = PostComment.find_by(user_id: current_user.id, tweet_id: params[:tweet_id],id: params[:id])
		comment.destroy
		redirect_to tweet_path(comment.tweet_id)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id,:tweet_id,:comment)
	end
end
