require "rails_helper"

describe "user sees all tags" do
  describe "they visit /tags" do
    it "displays all tags" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag_1 = article.tags.create(name: "Ruby")
      tag_2 = article.tags.create(name: "Technology")

      visit tags_path

      expect(page).to have_content(tag_1.name)
      expect(page).to have_content(tag_2.name)
    end
    it "links to view articles from tag name" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag_1 = article.tags.create(name: "Ruby")
      tag_2 = article.tags.create(name: "Technology")

      visit tags_path

      click_link tag_1.name

      expect(current_path).to eq(tag_path(tag_1))
      expect(page).to have_content(article.title)
    end
  end
end
