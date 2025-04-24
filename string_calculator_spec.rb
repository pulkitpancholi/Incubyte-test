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
      end
    end

    context "with two numbers" do
      it "returns the sum with comma delimiter" do
        expect(StringCalculator.add("1,5")).to eq(6)
      end
      
      it "returns the sum with newline delimiter" do
        expect(StringCalculator.add("1\n5")).to eq(6)
      end
    end

    context "with any amount of numbers" do
      it "returns the sum for three numbers" do
        expect(StringCalculator.add("1,2,3")).to eq(6)
      end
    end

    context "with mixed delimiters" do
      it "handles newlines and commas together" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end

      it "handles complex combinations" do
        expect(StringCalculator.add("10\n20,30\n40,50")).to eq(150)
      end

      it "handles consecutive delimiters" do
        expect(StringCalculator.add("1,\n2")).to eq(3)
      end
    end
  end
end
