class AddTweetIdToPostComments < ActiveRecord::Migration[5.1]
  def change
    add_column :post_comments, :tweet_id, :integer
  end
end
