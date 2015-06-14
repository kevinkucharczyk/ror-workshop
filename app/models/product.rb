class Product < ActiveRecord::Base
  validates :title, :description, :price, presence: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  belongs_to :category
  belongs_to :user
  has_many :reviews

def average_rating
  if self.reviews.size > 0
    self.reviews.average(:rating)
  else
    'none yet'
  end
end
end
