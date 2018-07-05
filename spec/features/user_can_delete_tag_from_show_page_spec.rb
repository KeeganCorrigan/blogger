require 'rails_helper'

describe "a user visits tag show" do
  describe "a user clicks on delete tag" do
    it "user can no longer find tag in index" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag_1 = article.tags.create(name: "Ruby")
      tag_2 = article.tags.create(name: "Technology")

      visit tag_path(tag_1)

      click_on "Delete"

      expect(current_path).to eq(tags_path)
      expect(page).to_not have_content(tag_1.name)
      expect(page).to have_content(tag_2.name)
    end
  end
end
