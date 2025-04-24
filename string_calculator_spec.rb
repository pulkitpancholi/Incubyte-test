# string_calculator_spec.rb

require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "with empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "with single number" do
      it "returns the number" do
        expect(StringCalculator.add("1")).to eq(1)
        expect(StringCalculator.add("1001")).to eq(0)
      end
    end

    context "with two numbers" do
      it "returns the sum" do
        expect(StringCalculator.add("1,5")).to eq(6)
        expect(StringCalculator.add("1,1001")).to eq(1)
      end
    end

    context "with unknown amount of numbers" do
      it "returns the sum" do
        expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
        expect(StringCalculator.add("1,1002,3,2000,5")).to eq(9)
      end
    end

    context "with new lines between numbers" do
      it "returns the sum" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
        expect(StringCalculator.add("1\n2001,3")).to eq(4)
      end
    end

    context "with custom delimiter" do
      it "returns the sum" do
        expect(StringCalculator.add("//.\n1.2.3")).to eq(6)
        expect(StringCalculator.add("//.\n1.2000.3")).to eq(4)
      end

      it "handles empty string with custom delimiter" do
        expect(StringCalculator.add("//;\n")).to eq(0)
      end
    end



    context "with negative numbers" do
      it "throws an exception" do
        expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("negatives not allowed: -2, -4")
        expect { StringCalculator.add("-1,-2,1001,-4") }.to raise_error("negatives not allowed: -1, -2, -4")
      end
    end

    context "with numbers larger than 1000" do
      it "ignores them" do
        expect(StringCalculator.add("2,1001")).to eq(2)
        expect(StringCalculator.add("2,1000")).to eq(1002)
        expect(StringCalculator.add("1001,1002,1003")).to eq(0)
        expect(StringCalculator.add("1,1001,2,1002,3")).to eq(6)
      end
    end

    context "with delimiters of any length" do
      it "returns the sum" do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context "with multiple delimiters" do
      it "returns the sum" do
        expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context "with multiple delimiters of length longer than one char" do
      it "returns the sum" do
        expect(StringCalculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
      end
    end
  end
end
