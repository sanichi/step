require 'rails_helper'

describe Image do
  context "check_year" do
    it "defaults" do
      expect(Image.check_year(nil)).to eq 2016
      expect(Image.check_year("")).to eq 2016
      expect(Image.check_year("abcde")).to eq 2016
      expect(Image.check_year("2015")).to eq 2016
      expect(Image.check_year("2020")).to eq 2016
    end

    it "accepts" do
      expect(Image.check_year("2016")).to eq 2016
      expect(Image.check_year("2017")).to eq 2017
      expect(Image.check_year("2018")).to eq 2018
      expect(Image.check_year("2019")).to eq 2019
    end
  end

  context "check_dim" do
    it "defaults" do
      expect(Image.check_dim(2016, nil)).to eq "1000x750"
      expect(Image.check_dim(2016, "")).to eq "1000x750"
      expect(Image.check_dim(2017, "abcde")).to eq "1000x750"
      expect(Image.check_dim(2018, "2018")).to eq "1000x750"
      expect(Image.check_dim(2019, "1000y600")).to eq "1000x600"
    end

    it "accepts" do
      expect(Image.check_dim(2016, "563x750")).to eq "563x750"
      expect(Image.check_dim(2017, "750x1000")).to eq "750x1000"
      expect(Image.check_dim(2018, "750x1000")).to eq "750x1000"
      expect(Image.check_dim(2019, "1000x750")).to eq "1000x750"
    end
  end

  context "check_num" do
    it "defaults" do
      expect(Image.check_num(2016, "1000x750", nil)).to eq 1
      expect(Image.check_num(2016, "1000x750", "")).to eq 1
      expect(Image.check_num(2016, "563x750", "2")).to eq 1
      expect(Image.check_num(2017, "750x1000", "0")).to eq 1
      expect(Image.check_num(2019, "750x1000", "4")).to eq 1
    end

    it "accepts" do
      expect(Image.check_num(2016, "563x750", "1")).to eq 1
      expect(Image.check_num(2017, "750x1000", "3")).to eq 3
      expect(Image.check_num(2018, "1000x750", "29")).to eq 29
      expect(Image.check_num(2019, "750x1000", "3")).to eq 3
    end
  end

  context "check" do
    it "defaults" do
      expect(Image.check(nil, nil, nil)).to eq Image.new(2016, "1000x750", 1)
      expect(Image.check("2017", nil, nil)).to eq Image.new(2017, "1000x750", 1)
      expect(Image.check(nil, "563x750", nil)).to eq Image.new(2016, "563x750", 1)
      expect(Image.check(nil, nil, "17")).to eq Image.new(2016, "1000x750", 17)
    end

    it "accepts" do
      expect(Image.check("2016", "1000x750", "20")).to eq Image.new(2016, "1000x750", 20)
      expect(Image.check("2017", "750x1000", "3")).to eq Image.new(2017, "750x1000", 3)
      expect(Image.check("2018", "750x1000", "7")).to eq Image.new(2018, "750x1000", 7)
      expect(Image.check("2019", "1000x750", "19")).to eq Image.new(2019, "1000x750", 19)
    end
  end

  context "next" do
    it "yes" do
      expect(Image.new(2016, "1000x750", 1).next).to eq Image.new(2016, "1000x750", 2)
      expect(Image.new(2016, "1000x750", 29).next).to eq Image.new(2016, "563x750", 1)
      expect(Image.new(2017, "750x1000", 2).next).to eq Image.new(2017, "750x1000", 3)
      expect(Image.new(2017, "1000x750", 28).next).to eq Image.new(2017, "750x1000", 1)
      expect(Image.new(2018, "750x1000", 6).next).to eq Image.new(2018, "750x1000", 7)
      expect(Image.new(2018, "1000x750", 40).next).to eq Image.new(2018, "750x1000", 1)
      expect(Image.new(2019, "1000x600", 10).next).to eq Image.new(2019, "1000x600", 11)
      expect(Image.new(2019, "1000x600", 13).next).to eq Image.new(2019, "1000x750", 1)
    end

    it "no" do
      expect(Image.new(2016, "999x562", 4).next).to be_nil
      expect(Image.new(2017, "750x1000", 3).next).to be_nil
      expect(Image.new(2018, "750x1000", 7).next).to be_nil
      expect(Image.new(2019, "750x1000", 3).next).to be_nil
    end
  end

  context "prev" do
    it "yes" do
      expect(Image.new(2016, "1000x750", 20).prev).to eq Image.new(2016, "1000x750", 19)
      expect(Image.new(2016, "999x562", 1).prev).to eq Image.new(2016, "563x750", 1)
      expect(Image.new(2017, "1000x750", 14).prev).to eq Image.new(2017, "1000x750", 13)
      expect(Image.new(2017, "750x1000", 1).prev).to eq Image.new(2017, "1000x750", 28)
      expect(Image.new(2018, "750x1000", 7).prev).to eq Image.new(2018, "750x1000", 6)
      expect(Image.new(2018, "750x1000", 1).prev).to eq Image.new(2018, "1000x750", 40)
      expect(Image.new(2019, "750x1000", 2).prev).to eq Image.new(2019, "750x1000", 1)
      expect(Image.new(2019, "1000x750", 1).prev).to eq Image.new(2019, "1000x600", 13)
    end

    it "no" do
      expect(Image.new(2016, "1000x750", 1).prev).to be_nil
      expect(Image.new(2017, "1000x750", 1).prev).to be_nil
      expect(Image.new(2018, "1000x750", 1).prev).to be_nil
      expect(Image.new(2019, "1000x600", 1).prev).to be_nil
    end
  end
end
