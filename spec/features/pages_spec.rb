require 'rails_helper'

describe PagesController do
  context "about" do
    it "show" do
      visit about_path
      expect(page).to have_title t("about.title")
    end
  end

  context "archive" do
    it "show" do
      visit archive_path
      expect(page).to have_title t("archive.title")
    end
  end

  context "home" do
    it "show" do
      visit home_path
      expect(page).to have_title t("home.title")
    end
  end

  context "info" do
    it "show" do
      visit info_path
      expect(page).to have_title t("info.title")
    end
  end

  context "register" do
    it "show" do
      visit register_path
      expect(page).to have_title t("register.title")
    end
  end
end
