class BlogPost < ApplicationRecord

  paginates_per 3

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, :blog_entry, presence: true
  validates :title, uniqueness: true, length: {maximum: 140}

end
