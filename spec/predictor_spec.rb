describe "Predictor" do

  it "can initiate a new instance of the class with a path to the JSON file" do
    expect {  Predictor.new('spec/fixtures/dataset_1.json') }.to_not raise_error
  end

  describe "#guess" do

    context "first dataset" do

      before(:each) do
        @predictor =  Predictor.new('spec/fixtures/dataset_1.json')
      end

      it "accepts two arguments: full name and company domain" do
        expect { @predictor.guess("Ailish Wong","wiser.com") }.to_not raise_error
      end

      it "returns an array" do
        expect(@predictor.guess("Ailish Wong","wiser.com").class).to eq(Array)
      end

      it "predicts first-name-dot-last-name emails" do
        expect(@predictor.guess("Ailish Wong","wiser.com")).to eq(["ailish.wong@wiser.com"])
      end

      it "predicts first-name-dot-last-initial emails" do
        expect(@predictor.guess("Makoto Laar", "google.com")).to eq(["makoto.l@google.com"])
      end

      it "predicts first-initial-dot-last-name emails" do
        expect(@predictor.guess("Harold Cooper", "hunch.com")).to eq(["h.cooper@hunch.com"])
      end

      it "predicts first-initial-dot-last-initial emails" do
        expect(@predictor.guess("Fiona Condon", "etsy.com")).to eq(["f.c@etsy.com"])
      end

      it "results in array of four guesses when there is no data for a particualar company domain" do
        whitehouse_guess = @predictor.guess("Jahmil Eady", "whitehouse.gov")

        expect(whitehouse_guess.class).to eq(Array)
        expect(whitehouse_guess.length).to eq(4)

        variations = ["jahmil.eady@whitehouse.gov", "jahmil.e@whitehouse.gov", "j.eady@whitehouse.gov", "j.e@whitehouse.gov"]
        variations.each { |v| expect(whitehouse_guess).to include(v) }
      end
    
    end

    describe "second dataset" do

      before(:each) do
        @second_predictor =  Predictor.new('spec/fixtures/dataset_2.json')
      end

      it "accepts two arguments: full name and company domain" do
        expect { @second_predictor.guess("Ailish Wong","wiser.com") }.to_not raise_error
      end

      it "returns an array" do
        expect(@second_predictor.guess("Ailish Wong","wiser.com").class).to eq(Array)
      end

      it "predicts first-name-dot-last-name emails" do
        expect(@second_predictor.guess("Ailish Wong","wiser.com")).to eq(["ailish.w@wiser.com"])
      end

      it "predicts first-name-dot-last-initial emails" do
        expect(@second_predictor.guess("Makoto Laar", "google.com")).to eq(["m.l@google.com"])
      end

      it "predicts first-initial-dot-last-name emails" do
        expect(@second_predictor.guess("Harold Cooper", "hunch.com")).to eq(["harold.c@hunch.com"])
      end

      it "predicts first-initial-dot-last-initial emails" do
        expect(@second_predictor.guess("Fiona Condon", "etsy.com")).to eq(["fiona.condon@etsy.com"])
      end

      it "results in array of four guesses when there is no data for a particualar company domain" do
        guess = @second_predictor.guess("Elana Simmons", "flatironschool.com")

        expect(guess.class).to eq(Array)
        expect(guess.length).to eq(4)

        variations = ["elana.simmons@flatironschool.com", "elana.s@flatironschool.com", "e.simmons@flatironschool.com", "e.s@flatironschool.com"]
        variations.each { |v| expect(guess).to include(v) }
      end

    end
  end

end
