class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments, foreign_key: 'posts_id'
    has_many :likes, foreign_key: 'posts_id'
  
    def update_comments_counter
      update(comments_count: comments.count)
    end
  
    def recent_comments
      comments.order(created_at: :desc).limit(5)
    end
  
    def update_likes_counter(new_likes_count)
      update(likes_count: new_likes_count)
    end
  end