class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :user_id, presence: true
    validates :content, presence: true, length: { in: 1..100 }
end
