require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays infromation for one article' do
      article = Article.create!(title: "Title 1", body: "Body 2")

      visit '/articles'

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
