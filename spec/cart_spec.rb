require_relative '../lib/cart.rb'

describe Cart do

  before do
    @cart = Cart.new
  end

  context "第一種情境：不打折" do

    it "第一集買 1 本" do
      @cart.add({ "1st": 1, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(100)
    end

    it "第一集買 3 本" do
      @cart.add({ "1st": 3, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(300)
    end

  end

  context "第二種情境：打 5% 折扣" do

    it "第一集買 1 本、第二集買 1 本" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(190)
    end

    it "第一集買 2 本、第二集買 2 本" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(380)
    end

    it "第一集買 1 本、第二集買 2 本" do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(290)
    end

    it "第一集買 2 本、第二集買 3 本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 0, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(480)
    end

  end

  context "第三種情境：打 10% 折扣" do

    it "第一集買 1 本、第二集買 1 本、第三集買 1 本" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(270)
    end

    it "第一集買 2 本、第二集買 2 本、第三集買 2 本" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(540)
    end

    it "第一集買 1 本、第二集買 2 本、第三集買 3 本" do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 3, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(560)
    end

    it "第一集買 2 本、第二集買 3 本、第三集買 3 本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 3, "4th": 0, "5th": 0 })
      expect(@cart.calculate).to eq(730)
    end

  end

  context "第四種情境：打 20% 折扣" do

    it "第一集買 1 本、第二集買 1 本、第三集買 1 本、第四集買 1 本" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 1, "5th": 0 })
      expect(@cart.calculate).to eq(320)
    end

    it "第一集買 2 本、第二集買 2 本、第三集買 2 本、第四集買 2 本" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 2, "5th": 0 })
      expect(@cart.calculate).to eq(640)
    end

    it "第一集買 2 本、第二集買 3 本、第三集買 4 本、第四集買 1 本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 4, "4th": 1, "5th": 0 })
      expect(@cart.calculate).to eq(880)
    end

    it "第一集買 2 本、第二集買 3 本、第三集買 3 本、第四集買 1 本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 3, "4th": 1, "5th": 0 })
      expect(@cart.calculate).to eq(780)
    end

  end

  context "第五種情境：打 25% 折扣" do

    it "第一集買 1 本、第二集買 1 本、第三集買 1 本、第四集買 1 本、第五集買 1 本" do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 1, "5th": 1 })
      expect(@cart.calculate).to eq(375)
    end

    it "第一集買 2 本、第二集買 2 本、第三集買 2 本、第四集買 2 本、第五集買 2 本" do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 2, "4th": 2, "5th": 2 })
      expect(@cart.calculate).to eq(750)
    end

    it "第一集買 2 本、第二集買 3 本、第三集買 4 本、第四集買 5 本、第五集買 1 本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 4, "4th": 5, "5th": 1 })
      expect(@cart.calculate).to eq(1255)
    end

    it "第一集買 2 本、第二集買 3 本、第三集買 4 本、第四集買 1 本、第五集買 7 本" do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 4, "4th": 1, "5th": 7 })
      expect(@cart.calculate).to eq(1455)
    end

  end

end
