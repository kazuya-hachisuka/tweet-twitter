railsclass RemovePostTweetIdFromPostComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :post_comments, :post_tweet_id, :integer
  end
end
