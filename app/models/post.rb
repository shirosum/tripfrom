class Post < ApplicationRecord
    belongs_to :user
    belongs_to :nation
    has_many :comments, dependent: :destroy

    # いいね
    has_many :likes, dependent: :destroy
    # いいねしたユーザー
    has_many :liked_users, through: :likes, source: :user
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end

    # tag
    has_and_belongs_to_many :tags
    after_create do
        post = Post.find_by(id: self.id)
        hashtags = self.caption.scan(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#＃'))
            post.tags << tag
        end
    end
    before_update do
        post = Post.find_by(id: self.id)
        post.tags.clear
        hashtags = self.caption.scan(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#＃'))
            post.tags << tag
        end
    end

    has_many_attached :captures
    validates :captures, presence: true

    validates :caption, length: { maximum: 500 }
end
