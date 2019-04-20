class Tag < ApplicationRecord
    has_and_belongs_to_many :posts
    validates :name, presence: true, length: { maximum: 50 }
end
