describe "Predictor" do

  it "can initiate a new instance of the class with a path to the JSON file" do
    expect {  Predictor.new('lib/dataset.json') }.to_not raise_error
  end

  describe "#guess" do

    before(:each) do
      @my_predictor =  Predictor.new('lib/dataset.json')
    end

    it "accepts two arguments: full name and company domain" do
      expect { @my_predictor.guess("Ailish Wong","wiser.com") }.to_not raise_error
    end

    it "returns an array" do
      expect(@my_predictor.guess("Ailish Wong","wiser.com").class).to eq(Array)
    end

    it "predicts first-name-dot-last-name emails" do
      expect(@my_predictor.guess("Ailish Wong","wiser.com")).to eq(["ailish.wong@wiser.com"])
    end

    it "predicts first-initial-dot-last-name emails" do
      expect(@my_predictor.guess("Makoto Laar", "google.com")).to eq(["m.laar@google.com"])
    end

    it "predicts first-initial-dot-last-initial emails" do
      expect(@my_predictor.guess("Fiona Condon", "etsy.com")).to eq(["f.c@etsy.com"])
    end

    it "results in array of four guesses when there is no data for a particualar company domain" do
      whitehouse_guess = @my_predictor.guess("Jahmil Eady", "whitehouse.gov")

      expect(whitehouse_guess.class).to eq(Array)
      expect(whitehouse_guess.length).to eq(4)

      variations = ["jahmil.eady@whitehouse.gov", "jahmil.e@whitehouse.gov", "j.eady@whitehouse.gov", "j.e@whitehouse.gov"]
      variations.each { |v| expect(whitehouse_guess).to include(v) }
    end
    
  end
end
