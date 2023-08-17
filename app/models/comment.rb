class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :posts, class_name: "Post"

    after_save :update_comment_counter

    def update_comment_counter
      posts.increment!(:comments_counter)
    end
  end