class Blog < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    belongs_to :nation

    has_many_attached :images
end
