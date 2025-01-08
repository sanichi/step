require 'rails_helper'

describe Image do
  let(:pimage) { Image.new(2019, "1000x750", 21) }
  let(:image)  { Image.new(2019, "1000x750", 22) }
  let(:nimage) { Image.new(2019, "1000x750", 23) }


  context "links", js: true do
    before(:each) do
      visit image.path
    end

    it "page" do
      expect(page).to have_title t("image.title")
      tag = find("img#image")
      expect(tag[:src]).to include(image.src)
      expect(tag[:alt]).to include(image.alt)
    end

    it "previous image" do
      click_link t("prev")
      expect(page).to have_title t("image.title")
      tag = find("img#image")
      expect(tag[:src]).to include(pimage.src)
      expect(tag[:alt]).to include(pimage.alt)
    end

    it "next image" do
      click_link t("next")
      expect(page).to have_title t("image.title")
      tag = find("img#image")
      expect(tag[:src]).to include(nimage.src)
      expect(tag[:alt]).to include(nimage.alt)
    end

    it "conference" do
      click_link image.year.to_s
      expect(page).to have_title t("conference.title", year: image.year)
    end
  end
end
