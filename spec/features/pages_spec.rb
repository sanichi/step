require 'rails_helper'

describe PagesController, js: true do
  context "nav links" do
    before(:each) do
      visit home_path
    end

    it "home" do
      expect(page).to have_title t("home.title")
      expect(page).to_not have_css "a", text: t("home.link")

      click_link t("about.link")
      expect(page).to have_title t("about.title")
      expect(page).to_not have_css "a", text: t("about.link")

      click_link t("archive.link")
      expect(page).to have_title t("archive.title")
      expect(page).to_not have_css "a", text: t("archive.link")

      click_link t("info.link")
      expect(page).to have_title t("info.title")
      expect(page).to_not have_css "a", text: t("info.link")

      click_link t("register.link")
      expect(page).to have_title t("register.title")
      expect(page).to_not have_css "a", text: t("register.link")

      click_link t("stepcast.link")
      expect(page).to have_title t("stepcast.title")
      expect(page).to_not have_css "a", text: t("stepcast.link")

      click_link t("home.link")
      expect(page).to have_title t("home.title")
    end
  end

  context "archive" do
    before(:each) do
      visit archive_path
    end

    it "2013" do
      click_link t("conference.acts", year: 2013)
      expect(page).to have_title t("conference.title", year: 2013)
    end

    it "2014" do
      click_link t("conference.acts", year: 2014)
      expect(page).to have_title t("conference.title", year: 2014)
    end

    it "2015" do
      click_link t("conference.step", year: 2015)
      expect(page).to have_title t("conference.title", year: 2015)
    end

    it "2016" do
      click_link t("conference.step", year: 2016)
      expect(page).to have_title t("conference.title", year: 2016)
    end

    it "2017" do
      click_link t("conference.step", year: 2017)
      expect(page).to have_title t("conference.title", year: 2017)
    end

    it "2018" do
      click_link t("conference.step", year: 2018)
      expect(page).to have_title t("conference.title", year: 2018)
    end

    it "2019" do
      click_link t("conference.step", year: 2019)
      expect(page).to have_title t("conference.title", year: 2019)
    end

    it "2023" do
      click_link t("conference.step", year: 2023)
      expect(page).to have_title t("conference.title", year: 2023)
    end

    it "2024" do
      click_link t("conference.step", year: 2024)
      expect(page).to have_title t("conference.title", year: 2024)
    end

    it "2025" do
      click_link t("conference.step", year: 2025)
      expect(page).to have_title t("conference.title", year: 2025)
    end

    # it "2026" do
    #   click_link t("conference.step", year: 2026)
    #   expect(page).to have_title t("conference.title", year: 2026)
    # end
  end

  context "conference links" do
    it "forward" do
      visit conference_2013_path
      expect(page).to have_title t("conference.title", year: 2013)
      click_link "2014"
      expect(page).to have_title t("conference.title", year: 2014)
      click_link "2015"
      expect(page).to have_title t("conference.title", year: 2015)
      click_link "2016"
      expect(page).to have_title t("conference.title", year: 2016)
      click_link "2017"
      expect(page).to have_title t("conference.title", year: 2017)
      click_link "2018"
      expect(page).to have_title t("conference.title", year: 2018)
      click_link "2019"
      expect(page).to have_title t("conference.title", year: 2019)
      click_link "2020"
      expect(page).to have_title t("conference.title", year: 2020)
      click_link "2021"
      expect(page).to have_title t("online.title", year: 2021)
      click_link "2022"
      expect(page).to have_title t("online.title", year: 2022)
      click_link "2023"
      expect(page).to have_title t("conference.title", year: 2023)
      click_link "2024"
      expect(page).to have_title t("conference.title", year: 2024)
      click_link "2025"
      expect(page).to have_title t("conference.title", year: 2025)
      click_link "2026"
      expect(page).to have_title t("conference.title", year: 2026)
    end

    it "backward" do
      visit conference_2026_path
      expect(page).to have_title t("conference.title", year: 2026)
      click_link "2025"
      expect(page).to have_title t("conference.title", year: 2025)
      click_link "2024"
      expect(page).to have_title t("conference.title", year: 2024)
      click_link "2023"
      expect(page).to have_title t("conference.title", year: 2023)
      click_link "2022"
      expect(page).to have_title t("online.title", year: 2022)
      click_link "2021"
      expect(page).to have_title t("online.title", year: 2021)
      click_link "2020"
      expect(page).to have_title t("conference.title", year: 2020)
      click_link "2019"
      expect(page).to have_title t("conference.title", year: 2019)
      click_link "2018"
      expect(page).to have_title t("conference.title", year: 2018)
      click_link "2017"
      expect(page).to have_title t("conference.title", year: 2017)
      click_link "2016"
      expect(page).to have_title t("conference.title", year: 2016)
      click_link "2015"
      expect(page).to have_title t("conference.title", year: 2015)
      click_link "2014"
      expect(page).to have_title t("conference.title", year: 2014)
      click_link "2013"
      expect(page).to have_title t("conference.title", year: 2013)
    end
  end
end
