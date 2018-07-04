#models/article.rb
class Article < ApplicationRecord
  has_many :comments

  validates_presence_of :title, :body

end
