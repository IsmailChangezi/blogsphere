class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :posts, class_name: "Post"

    after_create :increment_post_comments_counter

    private
  
    def increment_post_comments_counter
      post.update_comments_counter
    end
  end