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
      it "handles comma delimiter" do
        expect(StringCalculator.add("1,5")).to eq(6)
      end
      
      it "handles newline delimiter" do
        expect(StringCalculator.add("1\n5")).to eq(6)
      end
    end

    context "with multiple numbers" do
      it "handles comma delimiters" do
        expect(StringCalculator.add("1,2,3")).to eq(6)
      end

      it "handles newline delimiters" do
        expect(StringCalculator.add("1\n2\n3")).to eq(6)
      end

      it "handles mixed delimiters" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "with custom delimiters" do
      it "handles single character delimiter" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it "handles another single character delimiter" do
        expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
      end

      it "handles regex special character delimiter" do
        expect(StringCalculator.add("//.\n1.2.3")).to eq(6)
      end

      it "handles empty string after custom delimiter" do
        expect(StringCalculator.add("//;\n")).to eq(0)
      end

      it "handles single number after custom delimiter" do
        expect(StringCalculator.add("//;\n5")).to eq(5)
      end
    end

    context "with invalid input" do
      it "handles numbers after invalid delimiter format" do
        expect(StringCalculator.add("1//;\n1;2")).to eq(4) # 1 + 0 + 1 + 2
      end
    end
  end
end
