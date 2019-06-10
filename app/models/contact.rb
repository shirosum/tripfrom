class Contact < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VAILD_EAMIL_REGEX}
    validates :message, presence: true, length: {maximum: 1000}
end
