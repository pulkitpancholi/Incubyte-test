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
      it "returns the sum" do
        expect(StringCalculator.add("1,5")).to eq(6)
      end
    end

    context "with any amount of numbers" do
      it "returns the sum for three numbers" do
        expect(StringCalculator.add("1,2,3")).to eq(6)
      end

      it "returns the sum for five numbers" do
        expect(StringCalculator.add("10,20,30,40,50")).to eq(150)
      end

      it "returns the sum for ten numbers" do
        expect(StringCalculator.add("1,1,1,1,1,1,1,1,1,1")).to eq(10)
      end
    end
  end
end
