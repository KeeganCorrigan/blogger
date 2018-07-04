require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays infromation for one article' do
      article_1 = Article.create!(title: "Title 1", body: "Body 2")

      visist '/articles'

      click_link article.title

      expect_page.to have_content(article.title)
      expect_page.to have_content(article.body)
    end
  end
end
