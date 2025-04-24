# string_calculator_spec.rb
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "basic requirements" do
      it "returns 0 for empty string" do
        expect(StringCalculator.add("")).to eq(0)
      end

      it "returns the number itself for single number" do
        expect(StringCalculator.add("1")).to eq(1)
      end

      it "handles two numbers with comma delimiter" do
        expect(StringCalculator.add("1,5")).to eq(6)
      end
    end

    context "multiple numbers" do
      it "handles any amount of numbers" do
        expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
      end

      it "handles newline delimiters" do
        expect(StringCalculator.add("1\n2\n3")).to eq(6)
      end

      it "handles mixed comma and newline delimiters" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "custom delimiters" do
      it "handles single character delimiter" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it "handles special character delimiters" do
        expect(StringCalculator.add("//.\n1.2.3")).to eq(6)
      end

      it "handles empty string with custom delimiter" do
        expect(StringCalculator.add("//;\n")).to eq(0)
      end
    end

    context "negative numbers" do
      it "raises exception for single negative" do
        expect { StringCalculator.add("1,-2,3") }.to raise_error(StringCalculator::NegativeNumberError, "negative numbers not allowed -2")
      end

      it "shows all negatives in exception message" do
        expect { StringCalculator.add("-1,-2,3,-4") }.to raise_error(StringCalculator::NegativeNumberError, "negative numbers not allowed -1, -2, -4")
      end

      it "handles negatives with custom delimiters" do
        expect { StringCalculator.add("//$\n1$2$-3$4$-5") }.to raise_error(StringCalculator::NegativeNumberError, "negative numbers not allowed -3, -5")
      end
    end
  end
end
