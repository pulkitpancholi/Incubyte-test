# string_calculator.rb

class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    nums = numbers

    if numbers.start_with?("//")
      if numbers.include?("[")
        # Handle multiple delimiters of any length
        delimiter_part, nums = numbers.split("\n", 2)
        delimiters = delimiter_part.scan(/\[([^\]]+)\]/).flatten
      else
        # Handle single character delimiter
        delimiter_part, nums = numbers.split("\n", 2)
        delimiters = [delimiter_part[2..-1]]
      end
      # Always include newline as delimiter
      delimiters << "\n" unless delimiters.include?("\n")
    end

    # Create regex pattern that matches any delimiter
    delimiter_regex = Regexp.new(delimiters.map { |d| Regexp.escape(d) }.join('|'))
    numbers_array = nums.split(delimiter_regex).map(&:to_i)

    negatives = numbers_array.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers_array.reject { |n| n > 1000 }.sum
  end
end
