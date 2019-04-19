class Post < ApplicationRecord
    belongs_to :user
    belongs_to :nation
    has_many :comments, dependent: :destroy

    has_many :likes, dependent: :destroy
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end

    has_many :tags, through: :post_tags
    has_many :post_tags, dependent: :destroy

    has_many_attached :captures
    validates :captures, presence: true
end
