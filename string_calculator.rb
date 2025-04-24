# string_calculator.rb
class StringCalculator
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

    # Split and sum numbers
    numbers_array = input.split(/#{delimiter}/)
    numbers_array.map(&:to_i).sum
  end
end
