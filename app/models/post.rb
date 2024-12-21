class Post < ApplicationRecord
  belongs_to :member
  validates :title, :body, presence: true
  validates :title, :body, { minimum: 3, message: "must be atleast 3 characters in length"}
end
