require 'utils'

shared_context "invalid parameter" do
  it "should raise an error" do
    expect{ Utils.factorial(param) }.to raise_error "'#{param}' must be positive Natural number."
  end
end

describe "Factorial" do
  context "with alphanumeric number" do
    let(:param) { 'a' }
    it_behaves_like "invalid parameter"
  end

  context "with negative number" do
    let(:param) { -2 }
    it_behaves_like "invalid parameter"
  end

  context "with positive number" do
    context "when the parameter is 0" do
      it "factorial is 1" do
        expect(Utils.factorial 0).to eq 1
      end
    end

    context "when it is a natural number > 1" do
      context "with parameter 3" do
        it "returns 6" do
          expect(Utils.factorial 3).to eq 6
        end
      end

      context "with parameter 6" do
        it "returns 720" do
          expect(Utils.factorial 6).to eq 720
        end
      end

      context "with parameter 10" do
        it "returns 3628800" do
          expect(Utils.factorial 10).to eq 3628800
        end
      end
    end
  end
end

describe "Factorial Summary" do
  context "with number = 625" do
    let(:number) { 625 }

    it "returns factorial" do
      expect(Utils.factorial_summary(number).fetch(:factorial)).to be > 1
    end

    it "returns 156 zeros at right" do
      expect(Utils.factorial_summary(number).fetch(:zeros_at_right)).to eq 156
    end
  end

  context "with number = 2" do
    let(:number) { 2 }

    it "returns 0 zeros at right" do
      expect(Utils.factorial_summary(number).fetch(:zeros_at_right)).to eq 0
    end
  end

  context "with number = 8" do
    let(:number) { 8 }

    it "returns 1 zero at right" do
      expect(Utils.factorial_summary(number).fetch(:zeros_at_right)).to eq 1
    end
  end
end
