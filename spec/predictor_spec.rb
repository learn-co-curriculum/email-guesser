describe "Predictor" do

  it "can initiate a new instance of the class" do
    expect { Predictor.new }.to_not raise_error
  end

  describe "#guess" do

    before(:each) do
      predictor = Predictor.new
    end

    it "accepts two arguments: full name and company domain" do
      expect(predictor.guess("Ailish Wong","wiser.com")).to_not raise_error(ArgumentError)
    end

    it "predicts first-name-dot-last-name emails" do
      expect(predictor.guess("Ailish Wong","wiser.com")).to eq(["ailish.wong@wiser.com"])
    end

    it "predicts first-initial-dot-last-name emails" do
      expect(predictor.guess("Makoto Laar", "google.com")).to eq(["m.laar@google.com"])
    end

    it "predicts first-initial-dot-last-initial emails" do
      expect(predictor.guess("Fiona Condon", "etsy.com")).to eq(["f.e@etsy.com"])
    end

    it "results in array of four guesses when there is no data for a particualar company domain" do
      whitehouse_guess = predictor.guess("Jamil Eady", "whitehouse.gov")

      expect(whitehouse_guess.class).to eq(Array)
      expect(whitehouse_guess.length).to eq(4)

      variations = ["jahmil.eady@wiser.com", "jahmil.e@wiser.com", "j.eady@wiser.com", "j.e@wiser.com"]
      variations.each { |v| expect(whitehouse_guess).to include(v) }
    end
    
  end
end
