# string_calculator.rb
class StringCalculator
  class NegativeNumberError < StandardError
    def initialize(negatives)
      super("negative numbers not allowed #{negatives.join(', ')}")
    end
  end

  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /[,\n]/
    input = numbers

    # Handle custom delimiter
    if input.start_with?("//")
      parts = input.split("\n", 2)
      custom_delimiter = parts[0][2..-1]
      delimiter = Regexp.escape(custom_delimiter)
      input = parts[1] || ""
    end

    # Split and convert to numbers
    numbers_array = input.split(/#{delimiter}/).map(&:to_i)

    # Check for negative numbers
    negatives = numbers_array.select { |n| n < 0 }
    raise NegativeNumberError.new(negatives) unless negatives.empty?

    numbers_array.sum
  end
end
