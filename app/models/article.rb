class Article < ApplicationRecord
  include Visible

  extend FriendlyId
  friendly_id :title, use: :slugged
  # usage
  # Create: Article.create!(title: 'My Title', body: 'this is my body', status: 'public')
  # Get: Article.friendly.find('my-title')
  # More info: https://github.com/norman/friendly_id

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
