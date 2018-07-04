require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from the show article page' do
    describe 'they fill in the edit form' do
      it 'edits the article' do
        article_1 = Article.create!(title: "title 1", body: "body 1")

        visit article_path(article_1)
        click_link "Edit"

        fill_in "article[title]", with: "Edited title!"
        fill_in "article[body]", with: "Edited body!"

        click_on "Update Article"

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("Edited title!")
        expect(page).to_not have_content("title 1")
      end
    end
  end
end
