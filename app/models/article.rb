#models/article.rb
class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title, :body

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
end
