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
  end
end