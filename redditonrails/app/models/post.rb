class Post < ApplicationRecord
  validates :title, :user_id, presence: true


  belongs_to :atuhor,
    class_name: :User, 
    foreign_key: :user_id,
    inverse_of: :posts

end
