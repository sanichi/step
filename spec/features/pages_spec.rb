require 'rails_helper'

describe PagesController do
  before(:each) do
    visit home_path
  end

  context "home" do
    it "show" do
      expect(page).to have_title t("title")
    end
  end
end
