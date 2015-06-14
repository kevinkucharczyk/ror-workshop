class Review < ActiveRecord::Base
  validates :content, :rating, :user_id, presence: true

  belongs_to :product
  belongs_to :user
end
