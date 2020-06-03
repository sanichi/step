require 'rails_helper'

describe PagesController do
  before(:each) do
    visit home_path
  end

  it "home" do
    expect(page).to have_title t("home.title")
  end

  it "about" do
    click_link t("about.link")
    expect(page).to have_title t("about.title")
    click_link t("home.link")
    expect(page).to have_title t("home.title")
  end

  it "archive" do
    click_link t("archive.link")
    expect(page).to have_title t("archive.title")
    click_link t("home.link")
    expect(page).to have_title t("home.title")
  end

  it "info" do
    click_link t("info.link")
    expect(page).to have_title t("info.title")
    click_link t("home.link")
    expect(page).to have_title t("home.title")
  end

  it "register" do
    click_link t("register.link")
    expect(page).to have_title t("register.title")
    click_link t("home.link")
    expect(page).to have_title t("home.title")
  end
end
