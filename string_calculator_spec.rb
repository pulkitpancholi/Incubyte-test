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
        expect(StringCalculator.add("1001")).to eq(0)
      end

      it "handles two numbers with comma delimiter" do
        expect(StringCalculator.add("1,5")).to eq(6)
        expect(StringCalculator.add("1,1001")).to eq(1)
      end
    end

    context "multiple numbers" do
      it "handles any amount of numbers" do
        expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
        expect(StringCalculator.add("1,1002,3,2000,5")).to eq(9)
      end

      it "handles newline delimiters" do
        expect(StringCalculator.add("1\n2\n3")).to eq(6)
        expect(StringCalculator.add("1\n2000\n3")).to eq(4)
      end

      it "handles mixed comma and newline delimiters" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
        expect(StringCalculator.add("1\n2001,3")).to eq(4)
      end
    end

    context "custom delimiters" do
      it "handles single character delimiter" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
        expect(StringCalculator.add("//;\n1;1002")).to eq(1)
      end

      it "handles special character delimiters" do
        expect(StringCalculator.add("//.\n1.2.3")).to eq(6)
        expect(StringCalculator.add("//.\n1.2000.3")).to eq(4)
      end

      it "handles empty string with custom delimiter" do
        expect(StringCalculator.add("//;\n")).to eq(0)
      end
    end

    context "negative numbers" do
      it "raises exception for single negative" do
        expect { StringCalculator.add("1,-2,3") }.to raise_error(StringCalculator::NegativeNumberError, "negative numbers not allowed -2")
        expect { StringCalculator.add("1,-2,1001") }.to raise_error(StringCalculator::NegativeNumberError, "negative numbers not allowed -2")
      end

      it "shows all negatives in exception message" do
        expect { StringCalculator.add("-1,-2,3,-4") }.to raise_error(StringCalculator::NegativeNumberError, "negative numbers not allowed -1, -2, -4")
        expect { StringCalculator.add("-1,-2,1001,-4") }.to raise_error(StringCalculator::NegativeNumberError, "negative numbers not allowed -1, -2, -4")
      end
    end

    context "numbers greater than 1000" do
      it "ignores numbers greater than 1000" do
        expect(StringCalculator.add("2,1001")).to eq(2)
        expect(StringCalculator.add("2,1000")).to eq(1002)
        expect(StringCalculator.add("1001,1002,1003")).to eq(0)
        expect(StringCalculator.add("1,1001,2,1002,3")).to eq(6)
      end
    end
  end
end
